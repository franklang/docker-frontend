FROM ubuntu:16.04

WORKDIR /opt

RUN apt-get update \
    && apt-get install -y build-essential \
    && apt-get install -y curl \
    && curl -s https://raw.githubusercontent.com/nodesource/distributions/master/deb/setup_9.x > /tmp/setup_9.x \
    && bash /tmp/setup_9.x \
    && apt-get install -y nodejs \
    && apt-get install -y git-core \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update && apt-get install yarn \
    && /usr/bin/npm install -g gulp

VOLUME ["/opt"]
CMD ["yarn", "start"]
