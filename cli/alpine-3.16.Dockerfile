FROM php:8.1.16-cli-alpine3.16

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/
COPY ./cli/init.d /opt/litea/init.d
RUN chmod +x /opt/litea/init.d/*

COPY ./cli/conf /opt/litea/conf

COPY ./lit.sh /usr/local/bin/lit
COPY ./loop.sh /usr/local/bin/loop
COPY ./docker-entrypoint.sh /usr/local/bin/docker-entrypoint

RUN chmod +x \
    /usr/local/bin/lit \
    /usr/local/bin/docker-entrypoint

WORKDIR /var/www/

ENTRYPOINT [ "docker-entrypoint" ]
