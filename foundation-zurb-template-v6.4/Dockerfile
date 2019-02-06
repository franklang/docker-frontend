FROM ubuntu:16.04

WORKDIR /opt

ADD setup_4.x /tmp/setup_4.x
RUN bash /tmp/setup_4.x

RUN apt-get update
RUN apt-get install -y build-essential
RUN apt-get install -y nodejs
RUN apt-get install -y git-core
RUN /usr/bin/npm install -g gulp

VOLUME ["/opt"]
CMD ["npm", "start"]
#CMD ["npm", "run build"]
