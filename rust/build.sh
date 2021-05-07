#/bin/bash
export RUST_VERSION=1.52.0

docker build \
    --build-arg RUST_VERSION=$RUST_VERSION \
    --build-arg RUST_ANALYZER_VERSION='2021-05-03' \
    -t jackwzh/rust:"${RUST_VERSION}-centos7-devenv" .
