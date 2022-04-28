FROM golang:alpine AS app-builder


WORKDIR /app

COPY . .

RUN go mod tidy

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -tags netgo -ldflags '-w' -o binary *.go

FROM alpine:latest

WORKDIR /app

COPY --from=app-builder /app/binary /app/binary

EXPOSE 8000

CMD [ "/app/binary" ]