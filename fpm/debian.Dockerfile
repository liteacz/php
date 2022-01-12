FROM php:8.1.1-fpm-buster

COPY ./fpm/init.d /opt/litea/init.d
RUN chmod +x /opt/litea/init.d/*

COPY ./fpm/conf /opt/litea/conf

COPY ./lit.sh /usr/local/bin/lit
COPY ./docker-entrypoint.sh /usr/local/bin/docker-entrypoint

RUN chmod +x \
    /usr/local/bin/lit \
    /usr/local/bin/docker-entrypoint

RUN lit install fpm

WORKDIR /var/www/

ENTRYPOINT [ "docker-entrypoint" ]
CMD ["php-fpm"]
