from datetime import datetime, timedelta

def get_current_date():
    return datetime.datetime.now()


def create_date(y, m, d, hh, mm):
    return datetime.datetime(y, m, d, hh, mm)


def date_to_string(date):
    return str(date)


def string_to_date(date_string):
    return datetime.strptime(date_string, "%Y-%m-%dT%H:%M")

def days_before_date(date, days):
    return date - timedelta(days=int(days))