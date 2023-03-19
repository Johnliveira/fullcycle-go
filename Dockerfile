FROM golang:alpine AS build-golang
WORKDIR /opt/build
COPY . /opt/build
RUN go build fullcycle.go

FROM scratch
WORKDIR /exec
COPY --from=build-golang /opt/build/fullcycle /exec
ENTRYPOINT ["/exec/fullcycle"]