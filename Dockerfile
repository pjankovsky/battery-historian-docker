FROM golang:latest
MAINTAINER peter@jankovsky.me

RUN apt-get -y update && apt-get install -y openjdk-8-jre-headless

RUN go get -d -u github.com/google/battery-historian
WORKDIR /go/src/github.com/google/battery-historian
RUN go run setup.go

EXPOSE 9999
CMD go run cmd/battery-historian/battery-historian.go --port 9999
