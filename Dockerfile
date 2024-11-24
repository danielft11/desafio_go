FROM golang:alpine AS builder

WORKDIR /app

COPY main.go .

# Desabilitar o uso de módulos do Go
ENV GO111MODULE=off

RUN go build -ldflags="-s -w" -o main .

FROM scratch

COPY --from=builder /app/main .

CMD ["/main"]