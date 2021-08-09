#/bin/bash
export RUST_VERSION=1.54.0

docker build \
    --build-arg RUST_VERSION=$RUST_VERSION \
    --build-arg RUST_ANALYZER_VERSION='2021-08-09' \
    -t rust:"${RUST_VERSION}-centos7-devenv" .
