FROM golang:1.21 AS builder

WORKDIR /usr/src/app

COPY . .
RUN go build -o /usr/local/bin/app ./...

CMD ["app"]

FROM scratch

COPY --from=builder /usr/local/bin /

CMD ["/app"]