FROM php:8.0.1-fpm-alpine3.12

COPY ./init.d /opt/litea/init.d
RUN chmod +x /opt/litea/init.d/*

COPY ./conf /opt/litea/conf
COPY ./lit.sh /usr/local/bin/lit
COPY ./docker-entrypoint.sh /usr/local/bin/docker-entrypoint

RUN chmod +x \
    /usr/local/bin/lit \
    /usr/local/bin/docker-entrypoint

# This is dynamically replaced based on the selected image

#packages#

RUN lit install fpm

WORKDIR /var/www/

ENTRYPOINT [ "docker-entrypoint" ]
CMD ["php-fpm"]