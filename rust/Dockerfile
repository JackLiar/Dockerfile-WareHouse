FROM centos:7.3.1611
ARG RUST_VERSION
ARG RUSTUP_VERSION
ARG RUST_ANALYZER_VERSION
ENV RUSTUP_HOME=/usr/local/rustup \
    CARGO_HOME=/usr/local/cargo \
    PATH=/usr/local/cargo/bin:$PATH
RUN yum install -y git gcc; \
    yum clean all; \
    url="https://static.rust-lang.org/rustup/archive/${RUSTUP_VERSION}}/x86_64-unknown-linux-gnu/rustup-init"; \
    curl -OL "$url"; \
    chmod +x rustup-init; \
    ./rustup-init -y --no-modify-path --default-toolchain $RUST_VERSION -c llvm-tools-preview -c rust-src \
    rm rustup-init; \
    chmod -R a+w $RUSTUP_HOME $CARGO_HOME; \
    rustup --version; \
    cargo --version; \
    rustc --version; \
    cargo install --git https://ghproxy.com/https://github.com/rust-analyzer/rust-analyzer.git --tag $RUST_ANALYZER_VERSION rust-analyzer; \
    cargo install flamegraph; \
    cargo install grcov; \
    rm -rf $CARGO_HOME/git $CARGO_HOME/registry; \
    localedef --no-archive -i en_US -f UTF-8 en_US.UTF-8
ENV LANG=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8

CMD [ "/bin/bash" ]
