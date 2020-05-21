import falcon


class Resource():
    def on_get(self, req, resp):
        resp.content_type = "text/html"
        resp.body = "Hello, Falcon!"

app = falcon.API()
resource = Resource()
app.add_route('/', resource)
