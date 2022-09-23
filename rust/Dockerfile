FROM centos:7.3.1611
ARG RUST_VERSION
ARG RUSTUP_VERSION
ENV RUSTUP_HOME=/usr/local/rustup \
    CARGO_HOME=/usr/local/cargo \
    PATH=/usr/local/cargo/bin:$PATH
RUN set -e -u; \
    curl -OL https://forensics.cert.org/cert-forensics-tools-release-el7.rpm; \
    yum install -y cert-forensics-tools-release-el7.rpm; \
    yum install --enablerepo=forensics -y git gcc musl-gcc; \
    yum clean all
RUN url="https://static.rust-lang.org/rustup/archive/${RUSTUP_VERSION}/x86_64-unknown-linux-gnu/rustup-init"; \
    curl -OL "$url"; \
    chmod +x rustup-init; \
    ./rustup-init -y --no-modify-path \
    --default-toolchain $RUST_VERSION \
    --target x86_64-unknown-linux-musl \
    --profile complete; \
    rm rustup-init; \
    chmod -R a+w $RUSTUP_HOME $CARGO_HOME; \
    rustup --version; \
    cargo --version; \
    rustc --version
RUN cargo install flamegraph; \
    cargo install grcov; \
    rm -rf $CARGO_HOME/git $CARGO_HOME/registry; \
    localedef --no-archive -i en_US -f UTF-8 en_US.UTF-8
ENV LANG=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8

CMD [ "/bin/bash" ]
