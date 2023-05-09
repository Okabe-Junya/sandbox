FROM golang:1.20.4 AS builder

WORKDIR /usr/src/app

COPY . .

RUN go get -d -v ./...
RUN go install -v ./...
RUN go build -o ./bin/main


FROM gcr.io/distroless/base AS runtime
COPY --from=builder /usr/src/app/bin/main /usr/local/bin/main
CMD ["/usr/local/bin/main"]
