import pytest
import os, re, glob, collections, shutil, time, math
from flask import render_template, request , abort , redirect , Response ,url_for, Flask, jsonify, flash
from flask_login import LoginManager, login_user, logout_user, login_required, current_user
import jinja2
import json
from flask_sqlalchemy import SQLAlchemy
from app import *
from model.User import *
from model.EMS import EMS
from model.Session import Session
from model.userManager import login_manager
from model.Venue import Venue
from model.Event import *
from datetime import datetime, timedelta
from util.decorators import requires_fields
from util.helpers import string_to_date, days_before_date

#ran using "python -m pytest tests.py"

e = EMS()
u = Staff(name='Admin', id=1234, password=1234, email='admin@unsw.edu.au')
u1 = Staff(name='teacher', id=12345, password=12345, email='teacher@unsw.edu.au')
s = Student(name='Austin', id=5116890, password=1234, email='z5116890@unsw.edu.au')
g1 = Guest(name='g1', email='g1@mail.com', password='')
g2 = Guest(name='g2', email='g2@mail.com', password='')
g3 = Guest(name='g3', email='g3@mail.com', password='')
venue = Venue(name='venue1', location='sydney')

#create seminar
def test_legal_create_seminar_multiple_speakers():
	#legal way -> seminar with 3 sessions -> 3 guest speakers AND unique convenor
	assert isinstance(u, Staff)
	se = SeminarEvent(name='test', description='test', start_time=datetime.now(), end_time=datetime.now(), convenor=u)
	s1 = Session(name='s1 test', start_time=datetime.now(), end_time=datetime.now() + timedelta(days=1), deregister_timeframe=days_before_date(datetime.now(), 3), early_bird=days_before_date(datetime.now(), 2), speaker=g1, capacity=10, venue=venue, event=se)
	s2 = Session(name='s2 test', start_time=datetime.now(), end_time=datetime.now() + timedelta(days=1), deregister_timeframe=days_before_date(datetime.now(), 3), early_bird=days_before_date(datetime.now(), 2), speaker=g2, capacity=10, venue=venue, event=se)
	s3 = Session(name='s3 test', start_time=datetime.now(), end_time=datetime.now() + timedelta(days=1), deregister_timeframe=days_before_date(datetime.now(), 3), early_bird=days_before_date(datetime.now(), 2), speaker=g3, capacity=10, venue=venue, event=se)
	assert len(se.event_sessions) == 3
	assert isinstance(se.convenor, Staff)
	assert isinstance(s1.speaker, Guest)
	assert isinstance(s2.speaker, Guest)
	assert isinstance(s3.speaker, Guest)

def test_legal_create_seminar_convenor_is_speaker():
	#legal
	assert isinstance(u, Staff)
	se = SeminarEvent(name='test', description='test', start_time=datetime.now(), end_time=datetime.now(), convenor=u)
	s1 = Session(name='s1 test', start_time=datetime.now(), end_time=datetime.now() + timedelta(days=1), deregister_timeframe=days_before_date(datetime.now(), 3), early_bird=days_before_date(datetime.now(), 2), speaker=u, capacity=10, venue=venue, event=se)
	s2 = Session(name='s2 test', start_time=datetime.now(), end_time=datetime.now() + timedelta(days=1), deregister_timeframe=days_before_date(datetime.now(), 3), early_bird=days_before_date(datetime.now(), 2), speaker=u, capacity=10, venue=venue, event=se)	

def test_illegal_create_seminar_as_student():
	#illegal since only staff can be convenor
	assert isinstance(s, Student)
	se = SeminarEvent(name='test', description='test', start_time=datetime.now(), end_time=datetime.now(), convenor=s)
	with pytest.raises(userError) as info:
		se.user_check()
	assert "not a staff" in str(info.value)

# students can register for any session once in a seminar event
def test_legal_register_student():
	se = SeminarEvent(name='test', description='test', start_time=datetime.now(), end_time=datetime.now(),
				convenor=u)
	s1 = Session(name='s1 test', start_time=datetime.now(),
				end_time=datetime.now() + timedelta(days=1),
				deregister_timeframe=Session.calculate_date(datetime.now(), 1), 
				early_bird=Session.calculate_date(datetime.now(), 1), 
				speaker=u, event=se,
				capacity=10, venue=venue)
	s2 = Session(name='s2 test', start_time=datetime.now(),
				end_time=datetime.now() + timedelta(days=1),
				deregister_timeframe=Session.calculate_date(datetime.now(), 1), 
				early_bird=Session.calculate_date(datetime.now(), 1),
				speaker=u, event=se,
				capacity=10, venue=venue)
	s1.users_attendance.append(s)
	s2.users_attendance.append(s)
	assert len(s1.users_attendance) == 1
	assert len(s2.users_attendance) == 1


# staffs can register for any session once in a seminar event provided that they are not the convenor
def test_legal_register_staff():
	se = SeminarEvent(name='test', description='test', start_time=datetime.now(), end_time=datetime.now(),
				convenor=u)
	s1 = Session(name='s1 test', start_time=datetime.now(),
				end_time=datetime.now() + timedelta(days=1),
				deregister_timeframe=Session.calculate_date(datetime.now(), 1), 
				early_bird=Session.calculate_date(datetime.now(), 1),
				speaker=u, event=se,
				capacity=10, venue=venue)
	s2 = Session(name='s2 test', start_time=datetime.now(),
				end_time=datetime.now() + timedelta(days=1),
				deregister_timeframe=Session.calculate_date(datetime.now(), 1), 
				early_bird=Session.calculate_date(datetime.now(), 1),
				speaker=u, event=se,
				capacity=10, venue=venue)
	s1.add_attendee(u1)
	s2.add_attendee(u1)
	assert len(s1.users_attendance) == 1
	assert len(s2.users_attendance) == 1


# staff cannot register if they are the convenor
def test_illegal_register_staff():
	se = SeminarEvent(name='test', description='test', start_time=datetime.now(), end_time=datetime.now(),
					  convenor=u)
	s1 = Session(name='s1 test', start_time=datetime.now(),
				end_time=datetime.now() + timedelta(days=1),
				deregister_timeframe=Session.calculate_date(datetime.now(), 1), 
				early_bird=Session.calculate_date(datetime.now(), 1),
				speaker=u, event=se,
				capacity=10, venue=venue)
	s2 = Session(name='s2 test', start_time=datetime.now(),
				end_time=datetime.now() + timedelta(days=1),
				deregister_timeframe=Session.calculate_date(datetime.now(), 1), 
				early_bird=Session.calculate_date(datetime.now(), 1),
				speaker=u, event=se,
				capacity=10, venue=venue)
	s1.add_attendee(u)
	s2.add_attendee(u)
	assert len(s1.users_attendance) == 0
	assert len(s2.users_attendance) == 0


# staff and student cannot register twice for one session
def test_illegal_double_attend():
	se = SeminarEvent(name='test', description='test', start_time=datetime.now(), end_time=datetime.now(),
					  convenor=u)
	s1 = Session(name='s1 test', start_time=datetime.now(),
				 end_time=datetime.now() + timedelta(days=1),
				 deregister_timeframe=Session.calculate_date(datetime.now(), 1), 
				 early_bird=Session.calculate_date(datetime.now(), 1),
				 speaker=u, event=se,
				 capacity=10, venue=venue)
	s1.add_attendee(u1)
	s1.add_attendee(u1)
	assert len(s1.users_attendance) == 1
	s1.add_attendee(s)
	s1.add_attendee(s)
	assert len(s1.users_attendance) == 2


# guest speaker can attend their own event so that they dont have to pay
def test_legal_guest_speaker_attendance():
	se = SeminarEvent(name='test', description='test', start_time=datetime.now(), end_time=datetime.now(),
					  convenor=u)
	s1 = Session(name='s1 test', start_time=datetime.now(),
				 end_time=datetime.now() + timedelta(days=1),
				 deregister_timeframe=Session.calculate_date(datetime.now(), 1), 
				 early_bird=Session.calculate_date(datetime.now(), 1),
				 speaker=g1, event=se,
				 capacity=10, venue=venue)
	s1.add_attendee(g1)
	assert len(s1.users_attendance) == 1


# if booking date prior to early_bird deadline we we have discount
def test_attend_session_early_bird():
	se = SeminarEvent(name='test', description='test', start_time=string_to_date('2018-01-01T09:00'),
					  end_time=string_to_date('2018-12-31T09:00'),
					  convenor=u)
	s1 = Session(name='s1 test', start_time=datetime.now(),
				 end_time=datetime.now() + timedelta(days=2),
				 deregister_timeframe=Session.calculate_date(datetime.now(), 1), speaker=g1, event=se,
				 capacity=10, early_bird=datetime.now() - timedelta(days=1), venue=venue)
	s2 = Session(name='s2 test', start_time=datetime.now(),
				 end_time=datetime.now() + timedelta(days=2),
				 deregister_timeframe=Session.calculate_date(datetime.now(), 1), speaker=g1, event=se,
				 capacity=10, early_bird=datetime.now() + timedelta(days=1), venue=venue)
	assert s1.is_early_bird() == False
	assert s2.is_early_bird() == True

def test_user_can_only_attend_open_event():
	se = SeminarEvent(name='test', description='test', start_time=datetime.now(), end_time=datetime.now(),
					  convenor=u)
	s1 = Session(name='s1 test', start_time=datetime.now(),
				 end_time=datetime.now() + timedelta(days=1),
				 deregister_timeframe=Session.calculate_date(datetime.now(), 1), 
				 early_bird=Session.calculate_date(datetime.now(), 1),
				 speaker=g1, event=se,
				 capacity=10, venue=venue)
	# closed event
	se.status = 1
	with pytest.raises(attendanceError) as err:
		s1.add_attendee(g1)
	assert 'status of the event is closed' in str(err.value)

	# cancelled event
	se.status = 2
	with pytest.raises(attendanceError) as err:
		s1.add_attendee(g1)
	assert 'status of the event is cancelled' in str(err.value)

	# open event
	se.status = 0
	s1.add_attendee(g1)

def test_user_can_degrestration_prior_to_deregister_timeframe():
	se = SeminarEvent(name='test', description='test', start_time=datetime.now(), end_time=datetime.now(),
				  convenor=u)
	s1 = Session(name='s1 test', start_time=datetime.now(),
				 end_time=datetime.now() + timedelta(days=1),
				 deregister_timeframe=datetime.now() + timedelta(days=1), 
				 early_bird=Session.calculate_date(datetime.now(), 1),
				 speaker=g1, event=se,
				 capacity=10, venue=venue)
	s1.add_attendee(g1)
	s1.remove_attendee(g1)

	# user is able to deregister
	s1.deregister_timeframe = datetime.now() - timedelta(days=1)
	db.session.commit()

	# did not attend
	with pytest.raises(attendanceError) as err:
		s1.remove_attendee(g1)
	assert 'user did not attend this session' in str(err.value)

	# deregister within deregister timeframe
	s1.add_attendee(g1)
	with pytest.raises(attendanceError) as err:
		s1.remove_attendee(g1)
	assert 'user cannot deregist within deregister timeframe' in str(err.value)







