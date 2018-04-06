FROM golang:1.9-stretch

# Install CA certificates
RUN apt-get update -y && apt-get install -y ca-certificates

RUN mkdir -p /go/src/github.com/brianmartin/oauth2_proxy

WORKDIR /go/src/github.com/brianmartin/oauth2_proxy
COPY . /go/src/github.com/brianmartin/oauth2_proxy

RUN go get github.com/bitly/oauth2_proxy
RUN go build -o oauth2_proxy_brianmartin

ENTRYPOINT [ "./oauth2_proxy_brianmartin" ]
