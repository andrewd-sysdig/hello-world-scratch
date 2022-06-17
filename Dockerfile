FROM golang:1.18-alpine3.16 as builder

RUN mkdir /build
WORKDIR /build

COPY hello-world.go hello-world.go

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build hello-world.go

FROM scratch

COPY --from=builder /build/hello-world /hello-world

ENTRYPOINT ["/hello-world"]
