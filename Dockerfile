FROM alpine:3.8
MAINTAINER zhiwww <zhiwww@gmail.com>

WORKDIR /
ENV NPS_VERSION 0.20.2
ENV NPS_SERVER_ADDR 1.1.1.1:8024
ENV NPS_CLIENT_KEY 1234

RUN set -x && \
  mkdir /npc && cd /npc && \
  wget --no-check-certificate https://github.com/cnlh/nps/releases/download/v${NPS_VERSION}/linux_amd64_client.tar.gz && \ 
	tar xzf linux_amd64_client.tar.gz && \
	rm -rf *.tar.gz

VOLUME /npc/npc.conf

CMD /npc/npc -server=${NPS_SERVER_ADDR} -vkey=${NPS_CLIENT_KEY}