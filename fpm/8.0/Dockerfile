FROM php:8.0.1-fpm-alpine3.12

COPY ./fpm/8.0/init.d /opt/litea/init.d
RUN chmod +x /opt/litea/init.d/*

COPY ./fpm/8.0/conf /opt/litea/conf
COPY ./fpm/8.0/lit.sh /usr/local/bin/lit
COPY ./fpm/8.0/docker-entrypoint.sh /usr/local/bin/docker-entrypoint

RUN chmod +x \
    /usr/local/bin/lit \
    /usr/local/bin/docker-entrypoint

RUN lit install fpm

WORKDIR /var/www/

ENTRYPOINT [ "docker-entrypoint" ]
CMD ["php-fpm"]