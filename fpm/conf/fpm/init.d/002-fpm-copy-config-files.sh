#!/bin/sh

mkdir -p \
    /usr/local/etc/php \
    /usr/local/etc/php/php-fpm.d

cp /opt/litea/conf/fpm/php-fpm.conf \
    /opt/litea/conf/fpm/php.ini \
    /usr/local/etc/php

cp /opt/litea/conf/fpm/www.conf \
    /usr/local/etc/php/php-fpm.d