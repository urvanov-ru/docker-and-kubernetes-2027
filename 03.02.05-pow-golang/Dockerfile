FROM golang:1.26.4-alpine3.24 AS builder


WORKDIR /usr/src/app

# pre-copy/cache go.mod for pre-downloading dependencies and only redownloading them in subsequent builds if they change
COPY pow-golang.go ./
# RUN go mod download

COPY . .
RUN go build -v -o /usr/local/bin/app pow-golang.go

FROM alpine:3.24.1

COPY --from=builder /usr/local/bin/app /usr/local/bin/app

EXPOSE 8087

CMD ["app"]
