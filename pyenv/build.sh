#/bin/bash
export PYENV_VERSION=1.2.26
docker build \
    --build-arg PYENV_VERSION=$PYENV_VERSION \
    -t pyenv:$PYENV_VERSION-centos7 \
    .
