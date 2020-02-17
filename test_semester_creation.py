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

#ran using "python -m pytest test_sem.py"

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





