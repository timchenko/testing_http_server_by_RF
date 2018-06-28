from BaseHTTPServer import HTTPServer
from server import HttpProcessor
import sys

port = 8080
if len(sys.argv) > 1:
    port = int(sys.argv[1])
serv = HTTPServer(("localhost", port), HttpProcessor)
print port
serv.serve_forever()
