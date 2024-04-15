from http import server

class MyRequestHandler (server.SimpleHTTPRequestHandler):

    def end_headers (self):

        self.send_header('Access-Control-Allow-Origin', '*')

        self.send_header('Cross-Origin-Embedder-Policy', 'require-corp')

        self.send_header('Cross-Origin-Opener-Policy', 'same-origin')

        server.SimpleHTTPRequestHandler.end_headers(self)

if __name__ == '__main__':

    server.test(MyRequestHandler)