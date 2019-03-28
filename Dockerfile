FROM alpine:3.8
MAINTAINER zhiwww <zhiwww@gmail.com>

WORKDIR /
ENV NPS_VERSION 0.20.2

RUN set -x && \
  mkdir -p /npc/conf && cd /npc && \
  wget --no-check-certificate https://github.com/cnlh/nps/releases/download/v${NPS_VERSION}/linux_amd64_client.tar.gz && \ 
	tar xzf linux_amd64_client.tar.gz && \
	mv npc.conf ./conf && \
	rm -rf *.tar.gz

VOLUME /npc/conf

CMD /npc/npc -config /npc/conf/npc.conf