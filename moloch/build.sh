# /bin/bash

if [ "$1" == "--update" ];then
    wget \
        -O etc/ipv4-address-space.csv \
        https://www.iana.org/assignments/ipv4-address-space/ipv4-address-space.csv

    wget \
        -O etc/GeoLite2-Country.mmdb.gz \
        https://updates.maxmind.com/app/update_secure?edition_id=GeoLite2-Country
    gunzip -c etc/GeoLite2-Country.mmdb.gz > etc/GeoLite2-Country.mmdb && rm etc/GeoLite2-Country.mmdb.gz

    wget \
        https://updates.maxmind.com/app/update_secure?edition_id=GeoLite2-ASN \
        -O etc/GeoLite2-ASN.mmdb.gz
    gunzip -c etc/GeoLite2-ASN.mmdb.gz > etc/GeoLite2-ASN.mmdb && rm etc/GeoLite2-ASN.mmdb.gz

    wget \
        -O etc/oui.txt \
        https://raw.githubusercontent.com/wireshark/wireshark/master/manuf
fi

export MOLOCH_VERSION=2.1.2
docker build \
    --build-arg MOLOCH_VERSION=$MOLOCH_VERSION \
    --force-rm --tag moloch:$MOLOCH_VERSION . 