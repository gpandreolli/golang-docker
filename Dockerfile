FROM golang:1.21rc3-alpine AS builder

WORKDIR /app

COPY main.go ./

RUN go build -o /server main.go

EXPOSE 8080

CMD ["/server"]

FROM scratch
WORKDIR /app
COPY --from=builder /server /server
EXPOSE 8080
ENTRYPOINT ["/server"]
