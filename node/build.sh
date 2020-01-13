#/bin/bash
export NODE_VERSION=10.16.3
docker build --build-arg NODE_VERSION=$NODE_VERSION -t jackwzh/node:$NODE_VERSION .
