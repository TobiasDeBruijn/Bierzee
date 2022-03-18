FROM docker-registry.k8s.array21.dev/rust-base:latest AS BUILDER
COPY ./dal /opt/project/dal
COPY ./api /opt/project/api
COPY ./proto /opt/project/proto
COPY ./Cargo.toml /opt/project/

WORKDIR /opt/project
ENV RUSTFLAGS='-C link-args=-s'

RUN cargo +beta build --release --target x86_64-unknown-linux-musl --bin api

FROM alpine:latest
RUN apk add --no-cache ca-certificates
COPY --from=BUILDER /opt/project/target/x86_64-unknown-linux-musl/release/api /usr/local/bin/api

RUN chmod a+rx /usr/local/bin/*
RUN adduser api -s /bin/false -D -H
USER api

EXPOSE 8080
WORKDIR /usr/local/bin
ENTRYPOINT [ "/usr/local/bin/api" ]