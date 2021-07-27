FROM pyenv:2.0.4-centos7
ARG PYTHON_VERSION
RUN sed -e 's|^mirrorlist=|#mirrorlist=|g' \
        -e 's|^#baseurl=http://mirror.centos.org/centos|baseurl=https://mirrors.ustc.edu.cn/centos|g' \
        -i.bak \
        /etc/yum.repos.d/CentOS-Base.repo; \
    yum install -y gcc make zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel openssl-devel tk-devel libffi-devel; \
    env PYTHON_CONFIGURE_OPTS="--enable-shared --enable-optimization" pyenv install ${PYTHON_VERSION} && pyenv global ${PYTHON_VERSION}; \
    yum remove -y gcc make *-devel kernel-headers;\
    yum clean all; \
    rm -rf /var/cache/yum; \
    cd ${PYENV_ROOT}/versions/${PYTHON_VERSION}/lib/python3.7; \
    # 删除冗余的测试代码
    rm -rf test ctypes/test distutils/tests lib2to2/tests sqlite3/test tkinter/test; \
    localedef --no-archive -i en_US -f UTF-8 en_US.UTF-8
ENV LANG=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8

CMD [ "/bin/bash" ]
