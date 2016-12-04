FROM debian:jessie

MAINTAINER opsxcq <opsxcq@thestorm.com.br>

RUN apt-get update && \
    apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    apache2 \
    php5 php5-mysql && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Fix apache logs
#RUN ln -sf /proc/self/fd/1 /var/log/apache2/access.log &&
#    ln -sf /proc/self/fd/1 /var/log/apache2/error.log

EXPOSE 80

VOLUME /www
WORKDIR /www

COPY main.sh /

ENTRYPOINT ["/main.sh"]
