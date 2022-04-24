FROM golang:1.16-alpine3.14 AS builder

WORKDIR /build

ENV GOPROXY https://goproxy.cn
COPY go.mod .
#COPY go.sum .
RUN go mod download

COPY . .
RUN CGO_ENABLED=0 GOARCH=amd64 GOOS=linux go build -a -o app .

FROM scratch AS final

WORKDIR /app
COPY --from=builder /build/app .

CMD ["./app"]
