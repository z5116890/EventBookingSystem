import os, re, glob, collections, shutil, time, math
from flask import render_template, request , abort , redirect , Response ,url_for, Flask, jsonify, flash
from flask_login import LoginManager, login_user, logout_user, login_required, current_user
import jinja2
import json
from flask_sqlalchemy import SQLAlchemy
from app import *
from model.User import User
from model.EMS import EMS
from model.Session import Session
from model.userManager import login_manager
from model.Venue import Venue
from model.Event import *
from datetime import datetime
from util.decorators import requires_fields
from util.helpers import string_to_date, days_before_date

ems = EMS()

# return corresponding page of events 
def pagination(event_type, page):
	events = ems.get_events_by_type(event_type)
	events = events[page*8: page*8+8]
	events_list = [events[i:i+4] for i in range(0, len(events), 4)]
	return events_list

#index redirect
@app.route('/', methods=['GET'])
def root():
	return redirect(url_for('index'))


#default returns the login page
@app.route('/index', methods=['GET'])
def index():
	mapping = [['All Events', 'index'], ['Seminar', 'seminar'], ['Course', 'course']]
	return render_template('index.html', mapping=mapping)


#LOGIN PAGE FOR USER
@app.route('/login', methods=['POST','GET'])
def login():
	error = ''
	type = 'zid'
	id = request.form.get('zid', '')
	password = request.form.get('password', '')

	if id == '':
		id = request.form.get('email', '')
		type = 'email'

	attempt_times = 0

	try:
		ems.user_manager.userValidation(id, password, type)
		return jsonify({'status': 'success'})
	except Exception as err:
		if 'wrong password' in str(err):
			attempt_times = str(err).split(', ')[1]
			err = 'wrong password'
		return render_template('login_modal.html', type = str(err), attempt_times=int(attempt_times))

@app.route('/signin', methods=['POST'])
def signin():
	if ems.user_manager.guestSignin(request.form) == True:
		return jsonify({'status': 'success'})
	else:
		return render_template('signin_modal.html', err=True)

# logout request
@app.route('/logout', methods=['POST'])
@login_required
def logout():
	logout_user()
	return jsonify({'status': 'success'})


# unauthorized operation will navigate to index
@login_manager.unauthorized_handler
def unauthorized():
	return redirect(url_for('index'))


# load more items of the list
@app.route('/load_more', methods=['GET'])
def load_more():
	type = request.args.get('type')
	page = int(request.args.get('page'))
	events_list = pagination(type, page)
	page = page + 1

	if len(events_list) == 0:
		return jsonify({'status': 'no more'})
	return  jsonify({'status': 'success', 'html': render_template('events_page.html', events_list = events_list), 'page': page})


@login_manager.user_loader
def load_user(user_id):
	return ems.user_manager.get_user_by_id(int(user_id))


# dashboard for user
@app.route('/dashboard', methods=['GET'])
@login_required
def dashboard():
	if current_user.discriminator == 'trainer':
		mapping = [['Attending', 'attending'], ['Passed', 'attended'], ['Your Events', 'openPosts'], ['Your Past Events', 'closedPosts'], ['Cancelled Events', 'cancelled']]
	else:
		mapping = [['Attending', 'attending'], ['Past', 'attended']]

	return render_template('dashboard.html', mapping=mapping)


# detail for any event
@app.route('/event/<event_id>', methods=['GET'])
def event(event_id):
	event = ems.get_event_by_id(event_id)
	if event == None:
		return redirect(url_for('index'))
	return render_template('event.html', event=event, session_idx=1, current_user=current_user)


# profile page for speaker
@app.route('/profile/<guest_id>/', methods=['GET'])
def profile(guest_id):
	guest = ems.user_manager.get_user_by_id(guest_id)
	if guest == None:
		return redirect(url_for('index'))

	if guest.discriminator != 'guest':
		return redirect(url_for('index'))

	mapping = [['Currently Speaking At', 'speaker_events_%s' % guest_id]]
	return render_template('profile.html', guest=guest, mapping=mapping)

# load session
@app.route('/load_session', methods=['GET'])
def load_session():
	event_id = request.args.get('event_id')
	session_idx = int(request.args.get('session_idx'))
	attended = False
	# index out of range
	try:
		session = ems.get_event_by_id(event_id).event_sessions[session_idx - 1]
	except IndexError as err:
		return jsonify({'status': 'unsuccess'})

	attendance = len(session.users_attendance) / session.capacity * 100
	if current_user.is_authenticated == False:
		return jsonify({'status': 'unauth', 'html': render_template('event_details_session.html', session=session, attended=attended, attendance=round(attendance))})

	userType = current_user.discriminator	

	if session.event.is_one_of_speaker(current_user):
		userType = 'speaker'

	if session.event.convenor == current_user:
		userType = 'convenor'

	early_bird = session.is_early_bird()

	for s in current_user.attended_sessions:
		if s.id == session.id:
			attended = True

	if attendance == 100:
		return jsonify({'user_type': userType, 'early_bird': early_bird, 'status': 'full', 'html':render_template('event_details_session.html', session=session, attended=attended, attendance=round(attendance))})

	if session.is_ended():
		return jsonify({'user_type': userType, 'early_bird': early_bird, 'status': 'event_ended', 'html':render_template('event_details_session.html', session=session, attended=attended, attendance=round(attendance))})

	if session.session_status() == 1:
		return jsonify({'user_type': userType, 'early_bird': early_bird, 'status': 'event_closed', 'html':render_template('event_details_session.html', session=session, attended=attended, attendance=round(attendance))})

	if session.session_status() == 2:
		return jsonify({'user_type': userType, 'early_bird': early_bird, 'status': 'event_cancelled', 'html':render_template('event_details_session.html', session=session, attended=attended, attendance=round(attendance))})

	if session.cannot_deregister() and attended:
		return jsonify({'user_type': userType, 'early_bird': early_bird, 'status': 'past_deregister_timeframe', 'html':render_template('event_details_session.html', session=session, attended=attended, attendance=round(attendance))})

	return jsonify({'user_type': userType, 'early_bird': early_bird, 'status': 'loaded', 'html':render_template('event_details_session.html', session=session, attended=attended, attendance=round(attendance))})


# attend the chosen session
@app.route('/attend_session', methods=['POST'])
@login_required
def attend_session():
	session_id = int(request.form.get('session_id'))
	event_id = int(request.form.get('event_id'))

	event = ems.get_event_by_id(event_id)
	session = Session.query.filter_by(id=session_id).first()

	session.add_attendee(current_user)
	db.session.commit()

	current_user.emailNotification('''We confirm you have reserved the session %s of event %s successfully''' % (session.name, session.event.name))

	return jsonify({'status': 'success'})


# cancel the reservation of chosen session
@app.route('/deregister', methods=['POST'])
@login_required
def deregister():
	session_id = int(request.form.get('session_id'))
	event_id = int(request.form.get('event_id'))

	event = ems.get_event_by_id(event_id)
	session = Session.query.filter_by(id=session_id).first()

	session.remove_attendee(current_user)
	db.session.commit()

	current_user.emailNotification('''We confirm you have cancelled the session %s of event %s successfully''' % (session.name, session.event.name))

	return jsonify({'status': 'success'})

# cancel event
@app.route('/cancel_event', methods=['POST'])
@login_required
def cancel_event():
	event_id = request.form.get('cancel_button')
	event = ems.get_event_by_id(event_id)
	if request.method == "POST":
		ems.modify_event(2, event)
	for u in event.get_event_attendance_list():
		u.emailNotification('Your attended evnet %s has been cancelled' % event.name)

	return redirect(url_for('event', event_id=event_id))

# close event
@app.route('/close_event', methods=['POST'])
@login_required
def close_event():
	event_id = request.form.get('close_button')
	event = ems.get_event_by_id(event_id)
	if request.method == "POST":
		ems.modify_event(1, event)
	return redirect(url_for('event', event_id=event_id))

# reopen event
@app.route('/reopen_event', methods=['POST'])
@login_required
def reopen_event():
	event_id = request.form.get('reopen_button')
	event = ems.get_event_by_id(event_id)
	if request.method == "POST":
		ems.modify_event(0, event)
	return redirect(url_for('event', event_id=event_id))


# add new event
@app.route('/add_event', methods=['GET', 'POST'])
@login_required
@requires_fields(["name", "desc", "cap", "type", "session"], ['POST'])
def add_event():
	if not isinstance(current_user._get_current_object(), Staff):
		return redirect(url_for('index'))

	if request.method == "POST":
		session_dat = json.loads(request.form['session'])

		if (request.form['type'] == 'seminar'):
			event = SeminarEvent(name=request.form['name'], description=request.form['desc'], start_time=datetime.now(), end_time=datetime.now(), convenor=current_user)
			sessions = []

			for s in session_dat:
				usr = ems.user_manager.get_user_by_id(int(s['speaker']))
				venue = ems.get_venue_by_id(id=int(s['venue']))
				s = event.add_session(name=s['sessname'], start_time=string_to_date(s['start']), end_time=string_to_date(s['end']), deregister_timeframe=days_before_date(string_to_date(s['start']), request.form['deregister']), early_bird=days_before_date(string_to_date(s['start']), request.form['earlybird']), speaker=usr, capacity=s['sesscap'], venue=venue)
				s.add_attendee(usr)

			event.calculate_start_end()
			db.session.add(event)
		else:
			s = json.loads(request.form['session'])[0]

			venue = ems.get_venue_by_id(id=int(s['venue']))

			event = CourseEvent(name=request.form['name'], description=request.form['desc'], start_time=string_to_date(s['start']), end_time=string_to_date(s['end']), convenor=current_user)
			event.add_session(name=request.form['name'], start_time=string_to_date(s['start']), end_time=string_to_date(s['end']), deregister_timeframe=days_before_date(string_to_date(s['start']), request.form['deregister']), early_bird=days_before_date(string_to_date(s['start']), request.form['earlybird']), speaker=current_user, capacity=s['sesscap'], venue=venue)

			db.session.add(event)

		db.session.commit()

		if len(request.files) > 0:
			if 'cover' in request.files:
				Event.register_cover(request.files['cover'], event.id)
			if 'album[]' in request.files:
				Event.register_album(request.files.getlist('album[]'), event.id)

		# todo: make this more restful
		return jsonify({
			'status': 'success',
			'evt':    event.id
		})
	else:
		return render_template('add_event.html', venues=ems.get_all_venues())


@app.route('/user/<endpoint>', methods=['GET', 'POST'])
@login_required
def get_users(endpoint):
	isGuest = request.args.get('isGuest')
	if endpoint == 'list':
		all_users = ems.user_manager.get_all_users()
		if isGuest == 'true':
			return_list = list(filter(lambda x: isinstance(x, Guest), all_users))

		else:
			return_list = list(filter(lambda x: isinstance(x, Staff), all_users))
	
		return jsonify([
			{'id': user.id, 'name': user.name, 'email': user.email}
			for user in return_list
		])			
	elif endpoint == 'add':
		abort(418)
	else:
		abort(400)


# reset password for specific user
@app.route('/reset_password/<token>', methods=['GET', 'POST'])
def reset_password(token):
	noPassUser = None
	for user in ems.user_manager.get_all_users():
		#testing for user id instead of actual token
		if token == user.secret_token:
			noPassUser = user.id
			print(noPassUser)
			return render_template('reset_password.html', noPassUser=noPassUser)

	if request.method == "POST":
		for user in ems.user_manager.get_all_users():
			if str(user.id) in request.form:
				noPassUser = user
		password = request.form.get(str(noPassUser.id), '')
		confirm = request.form.get('confirm_pass', '')
		print(password, confirm)
		noPassUser.reset_password(password)

	return redirect(url_for('index'))


# page where allows user to reset password
@app.route('/reset_password_notification', methods=['GET', 'POST'])
def reset_password_notification():
	error = ""
	noPassUser = None
	if request.method == "POST":
		user_id = request.form.get('id', '')
		guest = ems.user_manager.get_guest_user_by_email(user_id)
		if guest != None:
			guest.reset_password_notification()
			error += "email sent!"
			return render_template('reset_password_notification.html', error=error)
		for user in ems.user_manager.get_all_users():
			print(user.id)
			if str(user_id) == str(user.id):
				user.reset_password_notification()
				error += "email sent!"
				return render_template('reset_password_notification.html', error=error)
		error += "User ID not found"


	return render_template('reset_password_notification.html', error=error)
