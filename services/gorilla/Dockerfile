FROM microservice_go:latest
WORKDIR /gorilla
COPY . /gorilla
RUN go mod tidy
RUN golint .
RUN go build .