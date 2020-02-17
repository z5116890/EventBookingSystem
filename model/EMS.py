from model.User import User
from model.Venue import Venue
from model.Event import Event
from model.userManager import userManager
from flask_login import LoginManager, login_user, logout_user, login_required, current_user
from flask import request
from model.User import *
from model.config import *
class EMS():
	def __init__(self):
		self._venues = Venue
		self._events = Event
		self._user_manager = userManager()

	@property
	def venues(self):
		return self._venues

	@venues.setter
	def venues(self, v):
		self._venues = v;

	@property
	def events(self):
		return self._events

	@events.setter
	def events(self, v):
		self._events = v;

	@property
	def user_manager(self):
		return self._user_manager

	@user_manager.setter
	def user_manager(self, v):
		self._user_manager = v;

	def get_all_venues(self):
		return self.venues.query.all()

	def get_all_seminars(self):
		return self.events.query.filter_by(discriminator='seminar').all()

	def get_all_courses(self):
		return self.events.query.filter_by(discriminator='course').all()

	def get_venue_by_id(self, id):
		return self.venues.query.filter_by(id=id).first()

	def get_all_events(self):
		return self._events.query.all()

	def get_event_by_id(self, event_id):
		return self._events.query.filter_by(id=event_id).first()

	def modify_event(self, status, event):
		event.status = status
		db.session.commit()

	def get_events_by_type(self, event_type):
		events = []

		if 'speaker_events' in event_type:
			guest_id = event_type.split('speaker_events_')[1]
			g = self.user_manager.get_user_by_id(guest_id)
			events = g.get_speaker_events()

		if event_type == 'index':
			for event in self.get_all_events():
				if event.status == 0 and event not in events:
					events.append(event)

		if event_type == 'seminar':
			for event in self.get_all_seminars():
				if event.status == 0 and event not in events:
					events.append(event)

		if event_type == 'course':
			for event in self.get_all_courses():
				if event.status == 0 and event not in events:
					events.append(event)

		if event_type == 'attending':
			for session in current_user.attended_sessions:
				if session.event.status == 0 and session.event not in events:
					events.append(session.event)
			

		if event_type == 'attended':
			for session in current_user.attended_sessions:
				if session.event.status == 1 and session.event not in events:
					events.append(session.event)

		if event_type == 'openPosts':
			for event in current_user.convenor_events:
				if event.status == 0 and event not in events:
					events.append(event)
		
		if event_type == 'closedPosts':
			for event in current_user.convenor_events:
				if event.status == 1 and event not in events:
					events.append(event)

		if event_type == 'cancelled':
			for event in current_user.convenor_events:
				if event.status == 2 and event not in events:
					events.append(event)

		return events
