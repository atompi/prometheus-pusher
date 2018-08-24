FROM golang:1.10.3
MAINTAINER atompi

EXPOSE 8080

COPY . /go/src/github.com/mission802/prometheus-pusher

 RUN cd /go/src/github.com/mission802/prometheus-pusher \
  && GOPATH=/go go build -o /bin/prometheus_pusher \
  && rm -rf /go/bin /go/pkg /var/cache/apk/*

ADD entrypoint.sh entrypoint.sh
RUN chmod +x entrypoint.sh

ENTRYPOINT [ "./entrypoint.sh" ]