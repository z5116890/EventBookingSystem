import os
from flask_login import LoginManager, login_user, logout_user, login_required, current_user
from model.User import *
from model.config import *
login_manager = LoginManager()


class userManager():
	def __init__(self):
		self._users = User

	@property
	def users(self):
		return self._users

	@users.setter
	def users(self, v):
		self._users = v;

	def get_user_by_id(self, user_id):
		return self.users.query.get(user_id)

	def get_user_by_name(self, user_name):
		return self.users.query.filter_by(name=user_name).all()

	def get_guest_user_by_email(self, user_email):
		return self.users.query.filter_by(email=user_email, discriminator='guest').first()

	def userValidation(self, id, password, type):
		if type == 'zid':
			user = self.get_user_by_id(id)
		else:
			user = self.get_guest_user_by_email(id)

		if user == None:
			raise Exception('not exist')
			return
		if user.password == password:
			user.password_attempt = 0
			db.session.commit()
			login_user(user)
			return
		else:
			if user.password_attempt <= 5:
				user.password_attempt = user.password_attempt + 1
				db.session.commit()
			raise Exception('''wrong password, %d''' % user.password_attempt)

	def guestSignin(self, formData):
		# user_id = formData.get('user_id', '')
		user_name = formData.get('name', '')
		password = formData.get('password', '')
		email = formData.get('email', '')
		description = formData.get('description', '')

		g = self.get_guest_user_by_email(email)

		if g != None:
			return False
			
		if description == '':
			u = Guest(name=user_name, password=password, email=email)
		else:
			u = Guest(name=user_name, password=password, email=email, description=description)

		try:
			db.session.add(u)
			db.session.commit()
		except Exception as err:
			print(err)
			return False

		login_user(u)
		return True

	def get_all_users(self):
		return self.users.query.all()
