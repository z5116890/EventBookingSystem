import enum
import pathlib
import model.Session
import model.Venue
from model.User import *
from model.Session import *
from model.Error import *
from model.config import *
import datetime
from sqlalchemy.ext.declarative import declared_attr
from flask_login import current_user

class EventStatus(enum.Enum):
    OPEN     = 0
    CLOSED   = 1
    CANCELLED = 2



class Event(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)
    description = db.Column(db.Text, nullable=False)
    status = db.Column(db.Integer, nullable=False, default=0)
    start_time = db.Column(db.DateTime, nullable=False)
    end_time = db.Column(db.DateTime, nullable=False)
    convenor_id = db.Column(db.Integer, db.ForeignKey('user.id'), nullable=False)
    convenor = db.relationship('User', backref = db.backref('convenor_events', lazy=True))
    discriminator = db.Column('type', db.String(50))
    __mapper_args__ = {'polymorphic_on': discriminator}

    def __init__(self, name, description, start_time, end_time, convenor, status=0):
        self.name = name
        self.description = description
        self.status = status
        self.start_time = start_time
        self.end_time = end_time
        self.convenor = convenor

    """
        unpacks the form into a event array and a generator for each session
    """
    
    def get_total_capacity(self):
        total = 0
        for s in self.event_sessions:
            total += s.capacity
        return total

    def is_one_of_speaker(self, user):
        for s in self.event_sessions:
            if s.speaker == user:
                return True
        return False


    def get_total_attend(self):
        total_attend = 0
        for s in self.event_sessions:
            total_attend += len(s.users_attendance)
        return total_attend

    def get_attendance(self):
        total_attend = self.get_total_attend()
        total = self.get_total_capacity()

        return (total_attend/total) * 100

    def add_session(self, name, start_time, end_time, deregister_timeframe, early_bird, speaker, capacity, venue):
        s = Session(name=name, start_time=start_time, end_time=end_time, deregister_timeframe=deregister_timeframe, early_bird=early_bird, speaker=speaker, event=self, capacity=capacity, venue=venue)
        db.session.add(s)
        return s

    def get_event_attendance_list(self):
        attendance = []
        for s in self.event_sessions:
            for u in s.users_attendance:
                if u not in attendance:
                    attendance.append(u)
        return attendance

    @staticmethod
    def make(form, sessions):
        start = min(sessions, key=lambda x: x['start_time'])['start_time']
        end   = max(sessions, key=lambda x: x['end_time'])['end_time']
        return Event(
            name          = form['name'],
            description   = form['desc'],
            status        = 0,
            capacity      = int(form['cap']),
            start_time    = start,
            end_time      = end,
            convenor_id   = current_user.id,
            venue_id      = -1 if form['type'] == 'seminar' else int(sessions[0]['venue']),  # todo: confirm this
            discriminator = form['type']
        )

    @staticmethod
    def add_image(img, name, eid):
        IMG_ROOT = "./static/photos"

        # todo: check cover file is appropriate
        pathlib.Path("{}/{}".format(IMG_ROOT, eid)).mkdir(parents=True, exist_ok=True)
        img.save("{}/{}/{}".format(IMG_ROOT, eid, name))

    @staticmethod
    def register_cover(cover_file, eid):
        Event.add_image(cover_file, "cover.{}".format(cover_file.filename.split('.')[-1]), eid)

    @staticmethod
    def register_album(alb, eid):
        if len(alb) == 0:
            return

        for i, pic in enumerate(alb):
            ext = pic.filename.split('.')[-1]
            Event.add_image(pic, "{}.{}".format(i, ext), eid)

    def user_check(self):
        try:
            if not isinstance(self.convenor, Staff):
                raise userError("not a staff")
        except userError as errmsg:
            raise


class SeminarEvent(Event):
    __mapper_args__ = {'polymorphic_identity': 'seminar'}

    def calculate_start_end(self):
        start = min(self.event_sessions, key=lambda x: x.start_time).start_time
        end   = max(self.event_sessions, key=lambda x: x.end_time).end_time
        self.start_time = start
        self.end_time = end

class CourseEvent(Event):
    __mapper_args__ = {'polymorphic_identity': 'course'}
