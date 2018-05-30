FROM golang:1.10 



ENV CGO_ENABLED=0
RUN go get github.com/golang/dep/cmd/dep
COPY abci $GOPATH/src/github.com/oatsaysai/tendermint-benchmark/abci

WORKDIR $GOPATH/src/github.com/oatsaysai/tendermint-benchmark/abci
RUN dep ensure && go install

ENV TERM=xterm-256color
ENTRYPOINT [ "abci" ]
