FROM $PARENT_IMAGE

RUN \
    # Build dependencies
    apk add --no-cache --virtual .build-deps \
        $PHPIZE_DEPS \
    # PHP Xdebug
    && pecl install xdebug-2.8.0 \
    && docker-php-ext-enable xdebug \
    # Cleanup
    && apk del .build-deps

COPY dev/xdebug.ini /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

COPY dev/scripts /var/www/scripts/
