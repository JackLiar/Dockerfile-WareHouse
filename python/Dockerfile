FROM pyenv:centos7-1.2.26
ARG PYTHON_VERSION
RUN yum install -y gcc make zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel openssl-devel tk-devel libffi-devel; \
    env PYTHON_CONFIGURE_OPTS="--enable-shared --enable-optimization" pyenv install ${PYTHON_VERSION} && pyenv global ${PYTHON_VERSION}; \
    yum remove -y gcc make *-devel kernel-headers;\
    yum clean all; \
    rm -rf /var/cache/yum; \
    cd ${PYENV_ROOT}/versions/${PYTHON_VERSION}/lib/python3.6; \
    # 删除冗余的测试代码
    rm -rf test ctypes/test distutils/tests lib2to2/tests sqlite3/test tkinter/test 

CMD [ "/bin/bash" ]
