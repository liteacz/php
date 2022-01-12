#!/bin/sh

[ -z "${FPM_ERROR_LOG_DIR}" ] && FPM_ERROR_LOG_DIR="/dev/stderr"

sed -i -e "s#%fpm_error_log_dir%#${FPM_ERROR_LOG_DIR}#g" \
    /usr/local/etc/php/php-fpm.conf