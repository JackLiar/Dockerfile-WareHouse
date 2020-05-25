FROM centos:7.3.1611
RUN yum install -y gcc zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel openssl-devel tk-devel libffi-devel git xz && \
    yum clean all && \
    rm -rf /var/cache/yum
ENV PYENV_ROOT="/opt/pyenv"
RUN git clone https://github.com/pyenv/pyenv.git ${PYENV_ROOT} --depth 1
ENV PATH="$PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH"

CMD [ "/bin/bash" ]
