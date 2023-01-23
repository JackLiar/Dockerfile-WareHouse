export PYTHON_VERSION=3.11.1
docker build \
    --build-arg PYTHON_VERSION=${PYTHON_VERSION} \
    -t python:${PYTHON_VERSION}-centos7 \
    .