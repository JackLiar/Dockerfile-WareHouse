FROM jackwzh/goenv:latest
ARG GO_VERSION
RUN goenv install ${GO_VERSION} && goenv global ${GO_VERSION} && goenv rehash
RUN go env -w GOPROXY=https://goproxy.cn,direct 

CMD [ "/bin/bash" ]
