FROM golang:1.8.4-alpine3.6
RUN set -eux; \
        apk add --no-cache \
                build-base \
                git \
        ;

RUN mkdir /app
RUN git clone https://github.com/wxw-matt/PaRa.git  /app/PaRa
RUN cd /app/PaRa
ENV GOPATH=/app/PaRa/Paxos_Lab
RUN cd $GOPATH/src/paxos_profiler && go build paxos_profiler.go && ./paxos_profiler
WORKDIR $GOPATH/src/paxos_profiler
CMD ./paxos_profiler
