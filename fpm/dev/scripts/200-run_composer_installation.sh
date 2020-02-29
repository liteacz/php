#!/bin/sh

# Check if vendor folder exists
# if not run composer install
# Variable $RUN_COMPOSER must be set to 1
if [ ! -z "$RUN_COMPOSER" ] && [ "$RUN_COMPOSER" = 1 ] && [ ! -d vendor ]; then
    composer install \
        -a \
        --prefer-dist \
        --no-suggest
fi
