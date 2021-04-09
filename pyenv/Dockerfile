FROM centos:7.3.1611
ARG PYENV_VERSION
RUN curl -o /opt/peynv.tar.gz -L https://github.com/pyenv/pyenv/archive/refs/tags/${PYENV_VERSION}.tar.gz; \
    tar xf /opt/peynv.tar.gz -C /opt; \
    rm /opt/peynv.tar.gz; \
    mv /opt/pyenv-${PYENV_VERSION} /opt/pyenv

ENV PYENV_ROOT="/opt/pyenv"
ENV PATH="$PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH"

CMD [ "/bin/bash" ]
