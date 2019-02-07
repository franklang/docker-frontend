# https://github.com/zurb/foundation-zurb-template/tree/master#manual-setup

FROM ubuntu:16.04

WORKDIR /opt

ADD setup_8.x /tmp/setup_8.x
RUN bash /tmp/setup_8.x

RUN apt-get update
RUN apt-get install -y build-essential
RUN apt-get install -y nodejs
RUN apt-get install -y git-core
RUN /usr/bin/npm install -g gulp
RUN /usr/bin/npm install -g yarn

VOLUME ["/opt"]
CMD ["yarn", "start"]
#CMD ["yarn", "run build"]
