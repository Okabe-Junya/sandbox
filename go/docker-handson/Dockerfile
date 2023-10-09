FROM golang:1.21.2-alpine as builder

WORKDIR /usr/src/app

COPY . .

RUN go get -d -v ./...
RUN go install -v ./...
RUN CGO_ENABLED=0 GOOS=linux go build -o ./bin/main

FROM gcr.io/distroless/static as runtime
COPY --from=builder /usr/src/app/bin/main /usr/local/bin/main
CMD ["/usr/local/bin/main"]
