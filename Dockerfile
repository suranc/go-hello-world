FROM golang AS builder

ADD . /build
WORKDIR /build
ENV CGO_ENABLED=0
RUN go build .

FROM alpine

RUN apk add gcompat
COPY --from=builder /build/hello-world /hello-world

ENTRYPOINT ["/hello-world"]
