#/bin/bash
export RUST_VERSION=1.51.0

docker build \
    --build-arg RUST_VERSION=$RUST_VERSION \
    --build-arg RUST_ANALYZER_VERSION='2021-03-29' \
    -t jackwzh/rust:'1.51.0-centos7-devenv' .
