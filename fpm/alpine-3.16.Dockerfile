FROM php:8.1.18-cli-alpine3.16

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/
COPY ./fpm/init.d /opt/litea/init.d
RUN chmod +x /opt/litea/init.d/*

COPY ./fpm/conf /opt/litea/conf

COPY ./lit.sh /usr/local/bin/lit
COPY ./loop.sh /usr/local/bin/loop
COPY ./docker-entrypoint.sh /usr/local/bin/docker-entrypoint

RUN chmod +x \
    /usr/local/bin/lit \
    /usr/local/bin/docker-entrypoint

RUN lit install fpm

WORKDIR /var/www/

ENTRYPOINT [ "docker-entrypoint" ]
CMD ["php-fpm"]
