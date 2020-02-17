from model.config import *

class Venue(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)
    location = db.Column(db.String(80), nullable=False)

    def __init__(self, name, location):
    	self.name = name
    	self.location = location