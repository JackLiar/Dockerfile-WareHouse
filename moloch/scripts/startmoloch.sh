#!/bin/bash

set -e

if [ -z "$ES_USER" ] || [ -z "$ES_PASSWORD" ]
then
    curl -sS "http://$ES_HOST:$ES_PORT/_cluster/health?pretty&wait_for_status=yellow"
else
    curl -u "$ES_USER:$ES_PASSWORD" -sS "http://$ES_HOST:$ES_PORT/_cluster/health?pretty&wait_for_status=yellow"
fi

if [ $? -ne 0 ]; then
    echo "${ES_HOST}:${ES_PORT} is unavaliable\n"
    exit -1
fi
echo
echo "Connect ElasticSearch(http://$ES_HOST:$ES_PORT) successfully!"

# prepare environment variables
sed -i -- 's/not-set/no/g' /data/moloch/bin/Configure
if [ -z "$ES_USER" ] || [ -z "$ES_PASSWORD" ]
then
    export MOLOCH_ELASTICSEARCH="http://$ES_HOST:$ES_PORT"
else
    echo "Using a ACL enabled elasticsearch!"
    export MOLOCH_ELASTICSEARCH="http://$ES_USER:$ES_PASSWORD@$ES_HOST:$ES_PORT"
    echo "$MOLOCH_ELASTICSEARCH"
fi

# Configure Moloch to Run
if [ ! -f /opt/configured ]; then
    touch /opt/configured
    /data/moloch/bin/Configure
fi

# Give option to init ElasticSearch
if [ "$INITALIZEDB" = "true" ] ; then
    echo INIT | /data/moloch/db/db.pl http://$ES_HOST:$ES_PORT init
    /data/moloch/bin/moloch_add_user.sh admin "Admin User" $MOLOCH_PASSWORD --admin
fi

# Give option to wipe ElasticSearch
if [ "$WIPEDB" = "true" ]; then
    /data/wipearkime.sh
fi

echo "Visit http://127.0.0.1:8005 with your favorite browser."
echo "  user: admin"
echo "  password: $MOLOCH_PASSWORD"

mkdir -p /data/moloch/logs
if [ "$CAPTURE" = "on" ]; then
    echo "Launch capture..."
    # Turn some network interface options off, otherwise capture program would not function
    bin/moloch_config_interfaces.sh -c etc/config.ini
    bin/moloch-capture ${OPTIONS}
elif [ "$VIEWER" = "on" ]; then
    echo "Launch viewer..."
    cd /data/moloch/viewer; /data/moloch/bin/node viewer.js -c /data/moloch/etc/config.ini ${OPTIONS}
fi 
