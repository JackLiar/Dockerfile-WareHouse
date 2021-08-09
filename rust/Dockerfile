FROM centos:7.3.1611
ARG RUST_VERSION
ARG RUST_ANALYZER_VERSION
ENV RUSTUP_HOME=/usr/local/rustup \
    CARGO_HOME=/usr/local/cargo \
    PATH=/usr/local/cargo/bin:$PATH
RUN set -eux; \
    sed -e 's|^mirrorlist=|#mirrorlist=|g' \
    -e 's|^#baseurl=http://mirror.centos.org/centos|baseurl=https://mirrors.ustc.edu.cn/centos|g' \
    -i.bak \
    /etc/yum.repos.d/CentOS-Base.repo; \
    yum install -y git gcc; \
    yum clean all; \
    url="https://static.rust-lang.org/rustup/archive/1.24.3/x86_64-unknown-linux-gnu/rustup-init"; \
    curl -OL "$url"; \
    chmod +x rustup-init; \
    ./rustup-init -y --no-modify-path --default-toolchain $RUST_VERSION -c llvm-tools-preview -c rust-src \
    rm rustup-init; \
    chmod -R a+w $RUSTUP_HOME $CARGO_HOME; \
    rustup --version; \
    cargo --version; \
    rustc --version; \
    cargo install --git https://github.com/rust-analyzer/rust-analyzer.git --tag $RUST_ANALYZER_VERSION rust-analyzer; \
    cargo install flamegraph; \
    rm -rf $CARGO_HOME/git $CARGO_HOME/registry; \
    localedef --no-archive -i en_US -f UTF-8 en_US.UTF-8
ENV LANG=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8

CMD [ "/bin/bash" ]
