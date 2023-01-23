FROM centos:7.3.1611
ARG PYENV_VERSION
ENV PYENV_ROOT="/usr/local/pyenv"
ENV PATH="$PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH"
RUN curl -L https://github.com/pyenv/pyenv/archive/refs/tags/v${PYENV_VERSION}.tar.gz | tar xz -C /usr/local && \
    mv /usr/local/pyenv-${PYENV_VERSION} /usr/local/pyenv && \
    eval "$(pyenv init --path)"

CMD [ "/bin/bash" ]
