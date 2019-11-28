FROM golang:1.13.4
MAINTAINER atompi

EXPOSE 8080

COPY . /go/src/github.com/atompi/prometheus-pusher

 RUN cd /go/src/github.com/atompi/prometheus-pusher \
  && GOPATH=/go go build -o /bin/prometheus_pusher \
  && rm -rf /go/bin /go/pkg /var/cache/apk/*

ADD entrypoint.sh entrypoint.sh
RUN chmod +x entrypoint.sh

ENTRYPOINT [ "./entrypoint.sh" ]
