FROM centos:7.3.1611

ARG MOLOCH_VERSION=2.7.1
ARG MOLOCH_RPM_NAME="moloch-${MOLOCH_VERSION}-1.x86_64.rpm"


RUN yum install -y "https://s3.amazonaws.com/files.molo.ch/builds/centos-7/${MOLOCH_RPM_NAME}" \
    wget net-tools && \
    yum clean all && \
    rm -rf /var/cache/yum* 

# add scripts
COPY scripts /data/moloch/bin
COPY etc/* /data/moloch/etc/

ENV ES_HOST=localhost
ENV ES_PORT=9200
ENV MOLOCH_INTERFACE=eth0
ENV MOLOCH_PASSWORD=admin
# Initalize is used to reset the environment from scratch and rebuild a new ES Stack
ENV INITALIZEDB=false
# Wipe is the same as initalize except it keeps users intact
ENV WIPEDB=false
ENV CAPTURE=off
ENV VIEWER=off
# Update Path
ENV PATH="/data/moloch/bin:${PATH}"

EXPOSE 8005
WORKDIR /data/moloch

CMD [ "/data/moloch/bin/startmoloch.sh"]

