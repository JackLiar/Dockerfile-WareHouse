FROM jackwzh/nodenv:latest
ARG NODE_VERSION
RUN nodenv install ${NODE_VERSION} && nodenv global ${NODE_VERSION} && nodenv rehash

CMD [ "/bin/bash" ]
