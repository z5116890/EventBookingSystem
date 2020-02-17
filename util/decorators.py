from flask import request, jsonify
import functools

def requires_fields(fields=[], methods=['POST'], strict=True):
    def wrapper(fn):
        @functools.wraps(fn)
        def wrapped(*arg, **kwargs):
            if request.method not in methods:
                return fn()

            for f in fields:
                if f not in request.form or len(request.form[f]) == 0:
                    print(request.form)
                    r = jsonify({
                        "status": "failure",
                        # Human readable error message
                        "message": "Required field {} is empty or does not exist".format(f),
                        "dom":   {"code": "EI", "item": f}
                    })
                    r.status_code = 400
                    return r
            else:
                return fn()
        return wrapped
    return wrapper
