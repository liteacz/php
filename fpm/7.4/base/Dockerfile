FROM $PARENT_IMAGE

# The docker context is set to version directory (e.g.: 7.3)
# that means all paths are relative to this folder
# not the project root.
# This needs to be kept in mind when using Dockerfile directives
# such as COPY and ADD.

# Basic libraries
RUN echo "Installing required system libraries and php extensions" \
    && apk add --no-cache --virtual .build-deps \
        zlib-dev \
        oniguruma-dev \
        $PHPIZE_DEPS \
    && apk add --no-cache --virtual .persistent-deps \
        libzip-dev \
        libxml2-dev \
    # PHP extensions via docker-php-ext-install
    && docker-php-ext-install \
        bcmath \
        calendar \
        ctype \
        iconv \
        json \
        mbstring \
        opcache \
        pdo_mysql \
        tokenizer \
        xml \
        zip \
    # PHP extensions via pecl
    && pecl install \
        redis \
    && docker-php-ext-enable \
        redis \
    && echo "Creating working directories" \
    && mkdir \
        -m 0755 \
        -p /var/www/data /var/www/scripts \
    && echo "Cleaning build dependencies" \
    # Cleanup
    && apk del --no-cache .build-deps

# GD Installation in separate layer
RUN echo "Installing GD php extension" \
    && apk add --no-cache --virtual .build-deps \
    && apk add --no-cache \
      libpng-dev \
      freetype-dev \
      libjpeg-turbo-dev \
    && docker-php-ext-configure gd \
        --with-jpeg \
        --with-freetype \
    && NPROC=$(getconf _NPROCESSORS_ONLN) \
    # PHP packages
    && docker-php-ext-install -j${NPROC} gd \
    # Cleanup
    && apk del --no-cache .build-deps

COPY base/scripts /var/www/scripts/
COPY base/php.ini /usr/local/etc/php/php.ini
COPY base/php-fpm.conf /usr/local/etc/php-fpm.conf
COPY base/www.conf /usr/local/etc/php/php-fpm.d/www.conf

WORKDIR /var/www/data

COPY base/entrypoint.sh /var/www
RUN chmod +x /var/www/entrypoint.sh

CMD [ "/var/www/entrypoint.sh" ]
