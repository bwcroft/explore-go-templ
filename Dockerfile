##### Server Base #####
FROM golang:1.23-alpine3.20 as server-base
WORKDIR /app
COPY ./go.mod ./go.sum ./
RUN go mod download
COPY ./ .

##### Server Development #####
FROM server-base as server-dev
RUN go install github.com/air-verse/air@latest
CMD ["air", "-c", ".air.toml"]

##### Server Build #####
FROM server-base as server-build
RUN go build -o api ./cmd/api/main.go

##### Production Image #####
FROM alpine:3.20 as server
WORKDIR /app
COPY --from=api-build /app/api .
CMD ["./api"]
