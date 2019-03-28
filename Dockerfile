FROM alpine:3.8
MAINTAINER zhiwww <zhiwww@gmail.com>

WORKDIR /
ENV NPS_VERSION 0.20.2

RUN set -x && \
	wget --no-check-certificate https://github.com/cnlh/nps/releases/download/v${NPS_VERSION}/linux_amd64_server.tar.gz && \ 
	tar xzf linux_amd64_server.tar.gz && \
	rm -rf *.tar.gz

VOLUME /nps/conf

CMD /nps/nps start