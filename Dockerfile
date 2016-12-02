FROM debian:jessie

MAINTAINER opsxcq <opsxcq@thestorm.com.br>

RUN apt-get update && \
    apt-get upgrapde -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    apache2 \
    php5 php5-mysql && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN useradd --system --uid 666 -M --shell /usr/sbin/nologin web

USER web

EXPOSE 80

VOLUME /data
WORKDIR /data


