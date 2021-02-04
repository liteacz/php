#!/bin/sh

cp /opt/litea/conf/php/php-fpm.conf \
    /opt/litea/conf/php/php.ini \
    /usr/local/etc/php

cp /opt/litea/conf/php/www.conf \
    /usr/local/etc/php-fpm.d