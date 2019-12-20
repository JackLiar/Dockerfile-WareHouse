#/bin/bash
export GO_VERSION=1.13.5
docker build --build-arg GO_VERSION=$GO_VERSION -t jackwzh/golang:$GO_VERSION .
