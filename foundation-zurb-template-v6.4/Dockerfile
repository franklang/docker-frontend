FROM ubuntu:16.04

WORKDIR /opt

ADD setup_0.12 /tmp/setup_0.12
RUN bash /tmp/setup_0.12

RUN apt-get update
RUN apt-get install -y build-essential
RUN apt-get install -y nodejs
RUN apt-get install -y git-core
RUN /usr/bin/npm install -g gulp
RUN /usr/bin/npm install -g bower --allow-root

VOLUME ["/opt"]
CMD ["npm", "start"]
#CMD ["npm", "run build"]
