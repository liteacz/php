FROM php:8.1.1-cli-buster

COPY ./cli/init.d /opt/litea/init.d
RUN chmod +x /opt/litea/init.d/*

COPY ./cli/conf /opt/litea/conf

COPY ./lit.sh /usr/local/bin/lit
COPY ./docker-entrypoint.sh /usr/local/bin/docker-entrypoint

RUN chmod +x \
    /usr/local/bin/lit \
    /usr/local/bin/docker-entrypoint

WORKDIR /var/www/

ENTRYPOINT [ "docker-entrypoint" ]
