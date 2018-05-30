FROM golang:1.10 AS builder

ENV CGO_ENABLED=0
RUN go get github.com/gorilla/mux
COPY . $GOPATH/src/github.com/oatsaysai/tendermint-benchmark/RESTAPI

WORKDIR $GOPATH/src/github.com/oatsaysai/tendermint-benchmark/RESTAPI
RUN go install

FROM alpine:3.7

COPY --from=builder /go/bin/RESTAPI /usr/bin/RESTAPI

ENV TERM=xterm-256color
ENTRYPOINT [ "RESTAPI" ]
