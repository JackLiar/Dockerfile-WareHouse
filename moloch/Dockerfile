FROM centos:7.3.1611

ARG ARKIME_VERSION=3.1.1
ARG ARKIME_RPM_NAME="arkime-${ARKIME_VERSION}-1.x86_64.rpm"

# add scripts
COPY scripts /opt/arkime/bin
COPY etc/* /opt/arkime/etc/

RUN curl -C - -OL "https://s3.amazonaws.com/files.molo.ch/builds/centos-7/${ARKIME_RPM_NAME}"; \
    yum install -y ${ARKIME_RPM_NAME} wget net-tools; \
    yum clean all; \
    rm -rf /var/cache/yum ${ARKIME_RPM_NAME}; \
    chmod +x /opt/arkime/bin/startarkime.sh; \
    chmod +x /opt/arkime/bin/wipearkime.sh;\
    chmod +x /opt/arkime/bin/arkime-parse-pcap-folder.sh

ENV ES_HOST=localhost
ENV ES_PORT=9200
ENV ARKIME_INTERFACE=eth0
ENV ARKIME_PASSWORD=admin
# Initalize is used to reset the environment from scratch and rebuild a new ES Stack
ENV INITALIZEDB=false
# Wipe is the same as initalize except it keeps users intact
ENV WIPEDB=false
ENV CAPTURE=off
ENV VIEWER=off
# Update Path
ENV PATH="/opt:/opt/arkime/bin:${PATH}"

EXPOSE 8005
WORKDIR /opt/arkime

CMD [ "/bin/bash", "-c", "/opt/arkime/bin/startarkime.sh"]
