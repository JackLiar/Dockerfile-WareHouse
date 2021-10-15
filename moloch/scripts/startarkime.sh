#!/bin/bash

if [ -z "$ES_USER" ] || [ -z "$ES_PASSWORD" ]
then
    curl -sS "http://$ES_HOST:$ES_PORT/_cluster/health?wait_for_status=yellow"
else
    curl -u "$ES_USER:$ES_PASSWORD" -sS "http://$ES_HOST:$ES_PORT/_cluster/health?wait_for_status=yellow"
fi

if [ $? -ne 0 ]; then
    echo "${ES_HOST}:${ES_PORT} is unavaliable\n"
    exit -1
fi
echo
echo "Connect ElasticSearch(http://$ES_HOST:$ES_PORT) successfully!"

# prepare environment variables
sed -i -- 's/not-set/no/g' /opt/arkime/bin/Configure
if [ -z "$ES_USER" ] || [ -z "$ES_PASSWORD" ]
then
    export ARKIME_ELASTICSEARCH="http://$ES_HOST:$ES_PORT"
else
    echo "Using a ACL enabled elasticsearch!"
    export ARKIME_ELASTICSEARCH="http://$ES_USER:$ES_PASSWORD@$ES_HOST:$ES_PORT"
    echo "$ARKIME_ELASTICSEARCH"
fi

# Configure Arkime to Run
if [ ! -f /opt/configured ]; then
    touch /opt/configured
    /opt/arkime/bin/Configure
fi

# Give option to init ElasticSearch
if [ "$INITALIZEDB" = "true" ] ; then
    echo INIT | /opt/arkime/db/db.pl http://$ES_HOST:$ES_PORT init
    /opt/arkime/bin/arkime_add_user.sh admin "Admin User" $ARKIME_PASSWORD --admin
fi

# Give option to wipe ElasticSearch
if [ "$WIPEDB" = "true" ]; then
    /data/wipearkime.sh
fi

echo "Look at log files for errors"
echo "  /opt/arkime/logs/viewer.log"
echo "  /opt/arkime/logs/capture.log"
echo "Visit http://127.0.0.1:8005 with your favorite browser."
echo "  user: admin"
echo "  password: $ARKIME_PASSWORD"

mkdir -p /opt/arkime/logs
if [ "$CAPTURE" = "on" ]; then
    echo "Launch capture..."
    # Turn some network interface options off, otherwise capture program would not function
    /bin/bash /opt/arkime/bin/arkime_config_interfaces.sh
    /opt/arkime/bin/capture ${OPTIONS} |tee -a /opt/arkime/logs/capture.log 2>&1
elif [ "$VIEWER" = "on" ]; then
    echo "Launch viewer..."
    /bin/sh -c "cd /opt/arkime/viewer; /opt/arkime/bin/node viewer.js -c /opt/arkime/etc/config.ini ${OPTIONS} | tee -a /opt/arkime/logs/viewer.log 2>&1" 
fi 
