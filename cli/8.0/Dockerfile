FROM php:8.0.1-cli-alpine3.13

COPY ./fpm/8.0/init.d /opt/litea/init.d
RUN chmod +x /opt/litea/init.d/*

COPY ./fpm/8.0/conf /opt/litea/conf

COPY ./lit.sh /usr/local/bin/lit
COPY ./docker-entrypoint.sh /usr/local/bin/docker-entrypoint

RUN chmod +x \
    /usr/local/bin/lit \
    /usr/local/bin/docker-entrypoint

WORKDIR /var/www/

ENTRYPOINT [ "docker-entrypoint" ]
