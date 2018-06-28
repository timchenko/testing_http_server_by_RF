from BaseHTTPServer import BaseHTTPRequestHandler
import re


class HttpProcessor(BaseHTTPRequestHandler):
    def do_GET(self):
        last_header = str(self.headers).strip().split('\r\n')[-1]
        last_header_name = last_header.split(':')[0]
        if re.match(r'\A[a-zA-Z0-9]{1,12}\Z', last_header_name):
            self.send_response(200)
        else:
            self.send_response(500)
        self.end_headers()

    @staticmethod
    def is_good_name(name):
        return re.match(r'[a-zA-Z0-9]{1,12}', name) is not None
