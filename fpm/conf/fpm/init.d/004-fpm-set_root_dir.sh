#!/bin/sh

[ -z "${APP_DIR}" ] && APP_DIR="/var/www"
[ -z "${FPM_ROOT_DIR}" ] && FPM_ROOT_DIR="public"

sed -i -e "s#%fpm_root_dir%#${APP_DIR}/${FPM_ROOT_DIR}#g" \
    /usr/local/etc/php/php.ini \
    /usr/local/etc/php/php-fpm.d/www.conf
