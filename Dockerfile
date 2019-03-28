FROM alpine:3.8
MAINTAINER zhiwww <zhiwww@gmail.com>

WORKDIR /
ENV NPS_VERSION 0.20.2
ENV NPS_SERVER 1.1.1.1
ENV NPS_PORT 8024
ENV NPS_CLIENT_KEY 1234

RUN set -x && \
  wget --no-check-certificate https://github.com/cnlh/nps/releases/download/v${NPS_VERSION}/linux_amd64_client.tar.gz && \ 
	tar xzf linux_amd64_client.tar.gz && \
	rm -rf *.tar.gz

VOLUME /nps/conf

CMD /nps/nps -server=${NPS_SERVER}:${NPS_PORT} -vkey=${NPS_CLIENT_KEY}