class userError(Exception):
    def __init__(self, message, type=None):
        super().__init__(message)
        self.type = type

class attendanceError(Exception):
    def __init__(self, message, type=None):
        super().__init__(message)
        self.type = type