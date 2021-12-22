#!/bin/sh

if [[ ! -z "${COMPOSER_AUTO_INSTALL}" ]] && [[ "${COMPOSER_AUTO_INSTALL}" = 1 ]]; then
    composer install \
        -a \
        --prefer-dist \
        --no-suggest
fi

if [[ ! -z "${USER_ID}" ]] ; then
    echo "USER_ID specified: ${USER_ID}"
    echo "Changing ownership of the vendor directory"

    chown -R "${USER_ID}:${USER_ID}" vendor
fi