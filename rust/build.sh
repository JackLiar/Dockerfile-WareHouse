#/bin/bash
export RUST_VERSION=1.59.0


docker build \
    --build-arg RUST_VERSION=${RUST_VERSION} \
    --build-arg RUSTUP_VERSION=1.24.3 \
    --build-arg RUST_ANALYZER_VERSION=2022-02-21 \
    -t rust:"${RUST_VERSION}-centos7-devenv" .
