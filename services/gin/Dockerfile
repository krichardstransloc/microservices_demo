FROM microservice_go:latest
WORKDIR /gin
COPY . /gin
RUN go mod tidy
RUN golint .
RUN go build .