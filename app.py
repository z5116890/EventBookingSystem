import os, re, glob, collections, shutil, time, math
from flask import render_template, request , abort , redirect , Response ,url_for, Flask
from flask_login import LoginManager, login_user, logout_user, login_required, current_user
from flask_mail import Mail
import jinja2
import csv
import threading
import calendar
from flask_sqlalchemy import SQLAlchemy
from model.config import db, mail
from model.User import *
from model.Session import Session
from model.Attendance import Attendance
from model.Venue import Venue
from model.Event import *
from model.userManager import login_manager
from datetime import datetime
import os.path
from os import listdir

# register app
app = Flask(__name__)
app.secret_key = 'super secret key'
app.config['TEMPLATES_AUTO_RELOAD'] = True
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SEND_FILE_MAX_AGE_DEFAULT'] = 0

# regiester SQLAlchemy to flask
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///./db_files/EMS.db'
db.app = app
db.init_app(app)
db.create_all()
login_manager.setup_app(app)

# register jinja env to Flask
app.jinja_loader = jinja2.FileSystemLoader(['./static/templates', './static/templates/components', './static/templates/components/event_detail', './static/templates/navbar', './static/js', './static/css'])

# flask email setup
app.config['MAIL_SERVER']='smtp.gmail.com'
app.config['MAIL_PORT'] = 465
app.config['MAIL_USERNAME'] = 'hacker.comp1531@gmail.com'
app.config['MAIL_PASSWORD'] = 'hacker1531'
app.config['MAIL_USE_TLS'] = False
app.config['MAIL_USE_SSL'] = True
mail.app = app
mail.init_app(app)

# custom jinja test/filters
def is_seminar_event(e):
	return isinstance(e, SeminarEvent)

def is_course_event(e):
	return isinstance(e, CourseEvent)

def is_staff(e):
	if e.discriminator == 'trainer':
		return True
	return isinstance(e, Staff)

def is_guest(e):
	return isinstance(e, Guest)

def is_convenor(e):
	return e == current_user

def is_past_date(date):
	return datetime.now() > date

def get_image(e):
	if os.path.exists('''./static/photos/%d/cover.png''' % e):
		return ('''photos/%d/cover.png''' % e)

	if os.path.exists('''./static/photos/%d/cover.jpg''' % e):
		return ('''photos/%d/cover.jpg''' % e)

	if os.path.exists('''./static/photos/%d/cover.svg''' % e):
		return ('''photos/%d/cover.svg''' % e)

	return 'img/thumbnail_default.jpg'

def get_images(e):
	try:
		files = os.listdir('''./static/photos/%d/''' % e)
	except FileNotFoundError as err:
		return []

	srcs = []
	for f in files:
		srcs.append('''photos/%d/%s''' % (e,f))

	return srcs

def get_time_string(e):
	return e.strftime("%I:%M %p")

def get_month_string(e):
	return calendar.month_name[e].upper()[0:3]

def get_date_string(e):
	return e.strftime("%d %b, %Y")

app.jinja_env.tests['SeminarEvent'] = is_seminar_event
app.jinja_env.tests['CourseEvent'] = is_course_event
app.jinja_env.tests['Staff'] = is_staff
app.jinja_env.tests['Guest'] = is_guest
app.jinja_env.tests['PastDate'] = is_past_date
app.jinja_env.tests['IsConvenor'] = is_convenor
app.jinja_env.filters['TimeString'] = get_time_string
app.jinja_env.filters['MonthString'] = get_month_string
app.jinja_env.filters['DateString'] = get_date_string
app.jinja_env.filters['GetImage'] = get_image
app.jinja_env.filters['GetImages'] = get_images
app.jinja_env.globals.update(get_image=get_image)


################ create dump data #####################
def first_run():
	# load user_csv into db
	with open('./user.csv') as csvfile:
		reader = csv.DictReader(csvfile)
		for row in reader:
			name, zid, email, password, role = row.values()
			if role == 'trainee':
				u = Student(id=zid, name=name, password=password, email=email)
				db.session.add(u)
			elif role == 'trainer':
				# add user to db
				u = Staff(id=zid, name=name, password=password, email=email)
				db.session.add(u)
	# add user to db
	u = Staff(name='Admin', id=1234, password=1234, email='admin@unsw.edu.au')
	db.session.add(u)	
	u.secret_token = '1'
	db.session.commit()
	
	for i in range(0, 5):
		# add venue to db
		db.session.add(Venue(name='''venue %d''' %i, location='''location %d''' %i))

	v = Venue.query.all()[0]

	for i in range(0, 3):
		db.session.add(SeminarEvent(name='''seminar %d''' %i, description='''this is seminar %d''' %i, capacity=60, start_time=datetime.now(), end_time=datetime.now(), convenor=u, venue=v))

	# add event to db
	db.session.add(CourseEvent(name='course 1', description='this is course 1', capacity=60, start_time=datetime.now(), end_time=datetime.now(), convenor=u, venue=v))

	s = SeminarEvent.query.all()[0]
	c = CourseEvent.query.all()[0]

	for i in range(0, 2):
		db.session.add(Session(name='''session %d''' %i, start_time=datetime.now(), end_time=datetime.now(), deregister_timeframe=datetime.now(), speaker=u, event=s, capacity=s.capacity))

	db.session.add(Session(name='''session %d''' %i, start_time=datetime.now(), end_time=datetime.now(), deregister_timeframe=datetime.now(), speaker=u, event=c, capacity=s.capacity))
	db.session.commit()

	user1 = User.query.all()[-1]
	session1 = Session.query.all()[0]

	# user1 want to attend session1
	session1.users_attendance.append(user1)
	# OR
	# user1.attended_sessions.append(session1)

	# list all attending users of a session
	session1.users_attendance
	# list all attending sessions of a users
	user1.attended_sessions

	db.session.commit()

# first_run()

import routes
