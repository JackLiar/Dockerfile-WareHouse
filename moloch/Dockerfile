FROM centos:7.3.1611

ARG MOLOCH_VERSION=2.1.2
ARG MOLOCH_RPM_NAME="moloch-${MOLOCH_VERSION}-1.x86_64.rpm"

WORKDIR /data
RUN curl -C - -O "https://files.molo.ch/builds/centos-7/${MOLOCH_RPM_NAME}"
# COPY ${MOLOCH_RPM_NAME} ${MOLOCH_RPM_NAME}
RUN yum install -y ${MOLOCH_RPM_NAME} wget net-tools && yum clean all && rm -rf /var/cache/yum ${MOLOCH_RPM_NAME}

# add scripts
COPY scripts /data/moloch/bin
COPY etc/* /data/moloch/etc/
RUN chmod 755 /data/moloch/bin/startmoloch.sh
RUN chmod 755 /data/moloch/bin/wipemoloch.sh
RUN chmod 755 /data/moloch/bin/moloch-parse-pcap-folder.sh

ENV ES_HOST=localhost
ENV ES_PORT=9200
ENV MOLOCH_INTERFACE=eth0
ENV MOLOCH_PASSWORD=admin
# Initalize is used to reset the environment from scratch and rebuild a new ES Stack
ENV INITALIZEDB=false
# Wipe is the same as initalize except it keeps users intact
ENV WIPEDB=false
ENV CAPTURE=off
ENV VIEWER=on
# Update Path
ENV PATH="/data:/data/moloch/bin:${PATH}"

EXPOSE 8005
WORKDIR /data/moloch

CMD ["./bin/startmoloch.sh"]
