FROM ubuntu:16.04

WORKDIR /opt

RUN apt-get update \
    && apt-get install -y build-essential \
    && apt-get install -y curl \
    && curl -s https://raw.githubusercontent.com/nodesource/distributions/master/deb/setup_8.x > /tmp/setup_8.x \
    && bash /tmp/setup_8.x \
    && apt-get install -y nodejs \
    && apt-get install -y git-core \
    && /usr/bin/npm install -g gulp

VOLUME ["/opt"]
CMD ["yarn", "start"]
