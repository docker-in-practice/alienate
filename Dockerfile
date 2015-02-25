FROM ubuntu:14.04

RUN apt-get update && apt-get install -y alien file wget

ADD /usr/bin/alienate.sh alienate.sh
RUN chmod +x /usr/bin/alienate.sh

VOLUME /io

ENTRYPOINT ["/usr/bin/alienate.sh"]
