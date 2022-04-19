FROM golang:1.12.0-alpine3.9 AS build

WORKDIR /app

ADD . /app

RUN go build -o main .

FROM scratch

WORKDIR /

COPY --from=build /app/main /app/main

ENTRYPOINT [ "/app/main" ]