FROM ubuntu:16.04

WORKDIR /opt

RUN apt-get update \
    && apt-get install -y build-essential \
    && apt-get install -y curl \
    && curl -s https://raw.githubusercontent.com/nodesource/distributions/master/deb/setup_6.x > /tmp/setup_6.x \
    && bash /tmp/setup_6.x \
    && apt-get install -y nodejs \
    && apt-get install -y git-core \
    && /usr/bin/npm install -g gulp

VOLUME ["/opt"]
CMD ["npm", "start"]
