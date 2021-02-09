#!/bin/sh

[[ -z "${FPM_ERROR_LOG_DIR}" ]] && FPM_ERROR_LOG_DIR="/dev/stderr"

sed -i -e "s/%fpm_root_dir%/${FPM_ROOT_DIR}/g" \
    /usr/local/etc/php/php-fpm.conf