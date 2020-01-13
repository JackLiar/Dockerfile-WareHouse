FROM centos:7.3.1611 AS build-stage
RUN yum install -y git gcc make && yum clean all && rm -rf /var/cache/yum
ENV NODENV_ROOT="/opt/nodenv"
ENV PATH="$NODENV_ROOT/shims:$NODENV_ROOT/bin:$PATH"
RUN git clone https://github.com/nodenv/nodenv.git ${NODENV_ROOT} --depth 1 && \
    cd ${NODENV_ROOT} && src/configure && make -C src && \
    mkdir -p "$(nodenv root)"/plugins && \
    git clone https://github.com/nodenv/node-build.git --depth 1 "$(nodenv root)"/plugins/node-build

FROM centos:7.3.1611
ENV NODENV_ROOT="/opt/nodenv"
ENV PATH="$NODENV_ROOT/shims:$NODENV_ROOT/bin:$PATH"
COPY --from=build-stage ${NODENV_ROOT} ${NODENV_ROOT}
RUN yum install -y git && yum clean all && rm -rf /var/cache/yum

CMD [ "/bin/bash" ]
