# Microservices
This repo demonstrates core dependency management by extending base images. There are three
languages represented, each serving two microservices using different frameworks for a total of six
microservices. The six microservices are connected via nginx gateway and are accessible at
http://0.0.0.0:8080/<framework>/

Each language has a base image with common dependencies. Each microservice extends the language's
base image to install its own dependencies.

## Demo
We've added a `Makefile` for ease of demonstration.

### Build Initial Images
Running `make buildservices` will build the three base images, as well as the six microservice
images.

### Running Services
Run `make runservices` to turn on all of the servies.

You can see the services in action at:
- Express: http://0.0.0.0:8080/express/
- Falcon: http://0.0.0.0:8080/falcon/
- Fastify: http://0.0.0.0:8080/fastify/
- Flask: http://0.0.0.0:8080/flask/
- Gin: http://0.0.0.0:8080/gin/
- Gorilla: http://0.0.0.0:8080/gorilla/

When you're done, run `make stopservices` to turn off all of the servies.

## Under the Hood

### Python
The Python base image install `gunicorn` as a common dependency.

The two services exposed by Python run Flask and Falcon as their API frameworks. These services 
use `gunicorn` as their WSGI server.

### JavaScript
The JavaScript base image install `typescript` as a common dependency.

The two services exposed by JavaScript run Express and Fastify as their API frameworks. The
`docker build` process for compiles TypeScript into Javascript.

### Go
The Go base image install `golint` as a common dependency.

The two services exposed by Go run Gin and Gorilla as their API frameworks. The `docker build`
process for each runs `golint`.
