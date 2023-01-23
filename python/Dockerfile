FROM pyenv:2.3.11-centos7
ARG PYTHON_VERSION=3.11.1
RUN yum install -y epel-release && \
    yum install -y openssl11-devel gcc make zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel tk-devel libffi-devel xz-devel && \
    ls /usr/include/openssl11 && \
    ls /usr/lib64/openssl11 && \
    export CPPFLAGS="$CPPFLAGS $(pkg-config --cflags openssl11)" && \
    export LDFLAGS="$LDFLAGS $(pkg-config --libs openssl11)" && \
    export PYTHON_CONFIGURE_OPTS="--enable-shared --enable-optimization" && \
    pyenv install ${PYTHON_VERSION} && \
    pyenv global ${PYTHON_VERSION} && \
    yum remove -y gcc make *-devel kernel-headers &&\
    yum clean all && \
    rm -rf /var/cache/yum /tmp/python*.log && \
    cd ${PYENV_ROOT}/versions/${PYTHON_VERSION}/lib/python3.11 && \
    rm -rf test ctypes/test distutils/tests lib2to2/tests sqlite3/test tkinter/test && \
    localedef --no-archive -i en_US -f UTF-8 en_US.UTF-8 && \
    pyenv global ${PYTHON_VERSION} && \
    pyenv rehash && \
    pyenv --version && \
    python --version
ENV LANG=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8

CMD [ "python", "--version" ]
