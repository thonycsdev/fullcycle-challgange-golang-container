FROM golang:alpine3.19 AS builder
WORKDIR /app
COPY main.go .

RUN go run main.go

FROM scratch
WORKDIR /app
COPY --from=builder /app .
CMD ["go", "run", "main.go"]