#!/bin/sh

if [[ ! -z "${COMPOSER_AUTO_INSTALL}" ]] && [[ "${COMPOSER_AUTO_INSTALL}" = 1 ]]; then
    composer install \
        -a \
        --prefer-dist \
        --no-suggest
fi
