FROM golang:1.21 AS build

WORKDIR /app
COPY ./fullcycle.go .
RUN go mod init feedme
RUN go build -o ./dist/main

FROM scratch

WORKDIR /app
COPY --from=build ./app/dist .
ENTRYPOINT [ "./main" ]