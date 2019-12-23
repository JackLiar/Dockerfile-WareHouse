# /bin/bash

export MOLOCH_VERSION=2.1.2
docker build \
    --build-arg MOLOCH_VERSION=$MOLOCH_VERSION \
    --force-rm --tag moloch:$MOLOCH_VERSION . 