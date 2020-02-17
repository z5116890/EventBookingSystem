from model.config import *

class Attendance(db.Model):
    __tablename__ = 'attendance'
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'), primary_key=True)
    session_id = db.Column(db.Integer, db.ForeignKey('session.id'), primary_key=True)
    session = db.relationship('Session', backref="user_attendance")
    user = db.relationship('User', backref="session_attendance")