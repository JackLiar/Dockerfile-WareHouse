FROM centos:7.3.1611

ARG ARKIME_VERSION=4.1.0
ARG ARKIME_RPM_NAME="arkime-${ARKIME_VERSION}-1.x86_64.rpm"


RUN yum install -y "https://s3.amazonaws.com/files.molo.ch/builds/centos-7/${ARKIME_RPM_NAME}" \
    iproute wget net-tools && \
    yum clean all && \
    rm -rf /var/cache/yum*

# add scripts
COPY scripts /opt/arkime/bin
COPY etc/* /opt/arkime/etc/

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
ENV PATH="/opt/arkime/bin:${PATH}"

EXPOSE 8005
WORKDIR /opt/arkime

CMD [ "/opt/arkime/bin/startarkime.sh"]

