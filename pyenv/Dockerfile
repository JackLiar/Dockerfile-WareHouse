FROM centos:7.3.1611
ARG PYENV_VERSION
ENV PYENV_ROOT="/usr/local/pyenv"
ENV PATH="$PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH"
RUN curl -o /usr/local/peynv.tar.gz -L https://github.com/pyenv/pyenv/archive/refs/tags/v${PYENV_VERSION}.tar.gz; \
    tar xf /usr/local/peynv.tar.gz -C /usr/local; \
    rm /usr/local/peynv.tar.gz; \
    mv /usr/local/pyenv-${PYENV_VERSION} /usr/local/pyenv; \
    echo -e 'eval "$(pyenv init --path)"' > /root/.profile; \
    sed -i '2s/^/\neval "\$(pyenv init --path)"\n/' /root/.bash_profile; \
    echo -e 'eval "$(pyenv init -)"' > /root/.bashrc

CMD [ "/bin/bash" ]
