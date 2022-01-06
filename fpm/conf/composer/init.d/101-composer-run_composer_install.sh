#!/bin/sh

if [[ ! -z "${COMPOSER_AUTO_INSTALL}" ]] && [[ "${COMPOSER_AUTO_INSTALL}" = 1 ]]; then
    composer install \
        -a \
        --prefer-dist \
        --no-suggest
fi

if [[ ! -z "${FPM_USER_ID}" ]] ; then
    echo "FPM_USER_ID specified: ${FPM_USER_ID}"
    echo "Changing ownership of the vendor directory"

    chown -R "${FPM_USER_ID}:${FPM_USER_ID}" vendor
fi