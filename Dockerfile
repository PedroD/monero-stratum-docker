FROM ubuntu:16.04

RUN apt-get update

RUN apt-get install git cmake build-essential libssl-dev pkg-config libboost-all-dev golang -y

RUN git clone https://github.com/monero-project/monero.git
WORKDIR /monero
RUN git checkout tags/v0.10.3.1 -b v0.10.3.1
RUN cmake -DBUILD_SHARED_LIBS=1 .
RUN make

ENV GOPATH=/go
RUN go get github.com/goji/httpauth
RUN go get github.com/yvasiyarov/gorelic
RUN go get github.com/gorilla/mux

WORKDIR /
RUN git clone https://github.com/sammy007/monero-stratum.git
WORKDIR /monero-stratum
RUN MONERO_DIR=/monero cmake .
RUN make
RUN go build -o pool main.go

WORKDIR /monero-stratum

ADD config.json /monero-stratum/config.json

CMD ["./pool", "config.json"]
