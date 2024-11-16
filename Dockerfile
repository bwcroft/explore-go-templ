##### API Base #####
FROM golang:1.23-alpine3.20 as api-base
WORKDIR /app
COPY ./go.mod ./go.sum ./
RUN go mod download
COPY ./ .

# Generate Template Files
FROM ghcr.io/a-h/templ:latest AS generate-templ
WORKDIR /app
COPY --chown=65532:65532 . .
CMD ["templ", "generate"]

##### API Development #####
FROM api-base as api-dev
RUN go install github.com/air-verse/air@latest
CMD ["air", "-c", ".air.toml"]

##### API Build #####
FROM api-base as api-build
RUN go build -o api ./cmd/api/main.go

##### Production Image #####
FROM alpine:3.20 as production 
WORKDIR /app
COPY --from=api-build /app/api .
CMD ["./api"]
