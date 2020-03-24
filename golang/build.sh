#/bin/bash
export GO_VERSION=1.14.1
docker build --build-arg GO_VERSION=$GO_VERSION -t jackwzh/golang:$GO_VERSION .
