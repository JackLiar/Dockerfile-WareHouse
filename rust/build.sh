#/bin/bash
export RUST_VERSION=1.64.0

docker build \
    --build-arg RUST_VERSION=${RUST_VERSION} \
    --build-arg RUSTUP_VERSION=1.25.1 \
    -t rust:"${RUST_VERSION}-centos7-devenv" .
