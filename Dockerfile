#Stage 1
FROM golang:1.13.7-alpine3.11 as builder
COPY ./main.go ./
RUN go build -o /hello ./main.go

#Stage 2
FROM alpine:3.11
COPY --from=builder /hello .
ENTRYPOINT ["./hello"]
