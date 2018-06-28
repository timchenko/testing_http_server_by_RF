# testing_http_server_by_RF

## Test task in Nexign. 
It was necessary to create HTTP server which handle GET requests in the next way: take the last header, checking its name length (in interval 1..12) and symbols (should be small or capital English letters or digits). After that server should be test by [Robot Frameworks](http://robotframework.org)

## How to run server and tests
Run server:
        python main.py [xxxx]
Run tests (don't need to run the server)
        pybot [--variable PORT:xxxx] test_server.robot
Defined port xxxx=8080