FROM centos:7.3.1611
RUN yum install -y git yum clean all && rm -rf /var/cache/yum
ENV GOENV_ROOT="/opt/goenv"
RUN git clone https://github.com/syndbg/goenv.git ${GOENV_ROOT} --depth 1
ENV PATH="$GOENV_ROOT/shims:$GOENV_ROOT/bin:$PATH"
ENV PATH="$GOROOT/bin:$PATH:$GOPATH/bin"

CMD [ "/bin/bash" ]
