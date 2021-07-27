export PYTHON_VERSION=3.7.11
docker build \
    --build-arg PYTHON_VERSION=${PYTHON_VERSION} \
    -t python:${PYTHON_VERSION}-centos7 \
    .