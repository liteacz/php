#!/bin/sh

[ -z "$FPM_ROOT_DIR" ] && FPM_ROOT_DIR="www"

sed -i -e "s/\$FPM_ROOT_DIR/$FPM_ROOT_DIR/g" \
    /usr/local/etc/php/php-fpm.d/www.conf \
    /usr/local/etc/php/php.ini
