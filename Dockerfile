FROM golang:1.19 AS builder

WORKDIR /usr/src/app

COPY . .
RUN CGO_ENABLED=0 go build -o /app hello.go


FROM scratch

COPY --from=builder /app /app

CMD ["/app"]