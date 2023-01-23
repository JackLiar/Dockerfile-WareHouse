#/bin/bash
export PYENV_VERSION=2.3.11
docker build \
    --build-arg PYENV_VERSION=$PYENV_VERSION \
    -t pyenv:$PYENV_VERSION-centos7 \
    .
