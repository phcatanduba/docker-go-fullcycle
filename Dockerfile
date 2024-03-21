FROM golang AS build-stage

COPY main.go .

RUN go build main.go

FROM scratch

COPY --from=build-stage /go/main .

ENTRYPOINT ["./main"]
