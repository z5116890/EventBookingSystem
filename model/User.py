from flask_login import LoginManager, UserMixin
from model.config import *
from flask_mail import Message
import secrets

class User(UserMixin, db.Model):
	id = db.Column(db.Integer, primary_key=True)
	name = db.Column(db.String(80), nullable=False)
	password = db.Column(db.String(80), nullable=False)
	email = db.Column(db.String(80), nullable=False)
	discriminator = db.Column('role', db.String(50))
	secret_token = db.Column(db.String(80), nullable=True, default='')
	__mapper_args__ = {'polymorphic_on': discriminator}
	attended_sessions = db.relationship('Session', secondary="attendance")
	password_attempt = db.Column(db.Integer, default=0)

	def emailNotification(self, message):
		msg = Message("Enrollment Notification",
					  sender="hacker.comp1531@gmail.com",
					  recipients=[self.email])
		msg.body = message
		# mail.send(msg)
		print('Email has been sent to %s, content: %s' % (self.email, message));

	def reset_password_notification(self):
		token = secrets.token_hex()
		self.secret_token = token
		db.session.commit()
		url = '''http://localhost:5000/reset_password/%s''' % token
		msg = 'Click following link to reset your password: %s' % url
		self.emailNotification(msg)

	def reset_password(self, new_password):
		self.password = new_password
		self.secret_token = ''
		db.session.commit()

class Guest(User):
	__mapper_args__ = {'polymorphic_identity': 'guest'}
	description = db.Column(db.Text, nullable=False)

	def get_speaker_events(self):
		events = []
		for session in self.speaker_sessions:
			if session.event.status == 0 and session.event not in events:
				events.append(session.event)
		return events


class Staff(User):
	__mapper_args__ = {'polymorphic_identity': 'trainer'}
	
	def get_speaker_events(self):
		events = []
		for session in self.speaker_sessions:
			if session.event.status == 0 and session.event not in events:
				events.append(session.event)
		return events

class Student(User):
	__mapper_args__ = {'polymorphic_identity': 'trainee'}