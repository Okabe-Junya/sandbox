FROM golang:1.21-alpine AS builder

WORKDIR /go/src/app
COPY go.mod go.sum ./
RUN go mod download

COPY main.go .
RUN CGO_ENABLED=0 GOOS=linux go build -o bin/app

FROM gcr.io/distroless/static:nonroot

COPY --from=builder /go/src/app/bin/app /app

ENTRYPOINT ["/app"]
