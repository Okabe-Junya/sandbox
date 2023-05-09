FROM golang:1.20.4

WORKDIR /usr/src/app

COPY . .

# build
RUN go get -d -v ./...
RUN go install -v ./...
RUN go build -o ./bin/main

# run
CMD ["./bin/main"]
