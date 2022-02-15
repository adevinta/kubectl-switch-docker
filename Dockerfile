FROM golang:1.17-alpine3.15 as builder

RUN CGO_ENABLED=0 go install github.com/tjamet/kubectl-switch@v0.0.0-20220207215721-6ea13ceb4f53


FROM alpine:3.15

COPY --from=builder /go/bin/kubectl-switch /usr/local/bin/kubectl-switch

RUN addgroup -g 1000 user && adduser -h /home/user -G user -D -u 1000 user

USER user

ENTRYPOINT ["/usr/local/bin/kubectl-switch"]
