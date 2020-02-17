from flask_login import current_user
from datetime import datetime, timedelta
from model.config import *
from model.Error import attendanceError
from util.helpers import string_to_date, days_before_date

class Session(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)
    start_time = db.Column(db.DateTime, nullable=False)
    end_time = db.Column(db.DateTime, nullable=False)
    capacity = db.Column(db.Integer, nullable=False)
    speaker_id = db.Column(db.Integer, db.ForeignKey('user.id'), nullable=False)
    speaker = db.relationship('User', backref = db.backref('speaker_sessions', lazy=True))
    event_id = db.Column(db.Integer, db.ForeignKey('event.id'), nullable=False)
    event = db.relationship('Event', backref = db.backref('event_sessions', lazy=True))
    venue_id = db.Column(db.Integer, db.ForeignKey('venue.id'), nullable=False)
    venue = db.relationship('Venue', backref = db.backref('venue_sessions', lazy=True))
    users_attendance = db.relationship('User', secondary="attendance")
    deregister_timeframe = db.Column(db.DateTime, nullable=False)
    early_bird = db.Column(db.DateTime, nullable=False)

    def __init__(self, name, start_time, end_time, capacity, speaker, event, venue, deregister_timeframe, early_bird):
        self.name = name
        self.start_time = start_time
        self.end_time = end_time
        self.capacity = capacity
        self.speaker = speaker
        self.event = event
        self.venue = venue
        self.deregister_timeframe = deregister_timeframe
        self.early_bird = early_bird

    def is_early_bird(self):
        if datetime.now() < self.early_bird:
            return True
        return False

    def is_ended(self):
        if datetime.now() >= self.end_time:
            return True
        return False

    def session_status(self):
        return self.event.status

    def cannot_deregister(self):
        if datetime.now() >= self.deregister_timeframe:
            return True
        return False

    def add_attendee(self, user):
        try:
            if self.event.status == 1:
                raise attendanceError('status of the event is closed')
            if self.event.status == 2:
                raise attendanceError('status of the event is cancelled')
        except attendanceError as err:
            raise

        if user not in self.users_attendance: 
            if user != self.event.convenor:
                self.users_attendance.append(user)

    def remove_attendee(self, user):
        try:
            if user not in self.users_attendance:
                raise attendanceError('user did not attend this session')
        except attendanceError as err:
            raise

        try:
            if self.cannot_deregister():
                raise attendanceError('user cannot deregist within deregister timeframe')
        except attendanceError as err:
            raise

        self.users_attendance.remove(user)


    @staticmethod
    def unpack_session(dat):
        return list(map(lambda ent: {
            "start_time": datetime.strptime(ent['start'], "%Y-%m-%dT%H:%M"),
            "end_time":   datetime.strptime(ent['end'],   "%Y-%m-%dT%H:%M"),
            "venue":      ent['venue'],
            "speaker":    int(ent['speaker']) if 'speaker' in ent else current_user.id,
            "name":       ent['sessname'],
            "cap":        ent['sesscap']
        }, dat))

    @staticmethod
    def calculate_date(start, timeframe):
        return start - timedelta(days=int(timeframe))

    @staticmethod
    def make(sess, evt_id, context, req_context, sess_type):
        return Session(
            name=sess['name'],
            start_time=sess['start_time'],
            end_time=sess['end_time'],
            capacity=sess['cap'],
            speaker_id=sess['speaker'],
            event_id=evt_id,
            deregister_timeframe=days_before_date(sess['start_time'], req_context['deregister'])
        )
