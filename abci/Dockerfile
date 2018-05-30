FROM golang:1.10 AS builder

ENV CGO_ENABLED=0
RUN go get github.com/golang/dep/cmd/dep
COPY . $GOPATH/src/github.com/oatsaysai/tendermint-benchmark/abci

WORKDIR $GOPATH/src/github.com/oatsaysai/tendermint-benchmark/abci
RUN dep ensure && go install

FROM alpine:3.7

COPY --from=builder /go/bin/abci /usr/bin/abci

ENV TERM=xterm-256color
ENTRYPOINT [ "abci" ]
