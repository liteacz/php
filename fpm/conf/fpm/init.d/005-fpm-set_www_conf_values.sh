#!/bin/sh

[ -z "${WWW_POOL_NAME}" ] && WWW_POOL_NAME="www"
[ -z "${WWW_USER}" ] && WWW_USER="www-data"
[ -z "${WWW_GROUP}" ] && WWW_GROUP="www-data"

[ -z "${FPM_PORT}" ] && FPM_PORT="9000"
[ -z "${FPM_ACCESS_LOG}" ] && FPM_ACCESS_LOG="/dev/stdout"

sed -i -e "
s#%www_pool_name%#${WWW_POOL_NAME}#g
s#%www_user%#${WWW_USER}#g
s#%www_group%#${WWW_GROUP}#g
s#%fpm_port%#${FPM_PORT}#g
s#%fpm_access_log%#${FPM_ACCESS_LOG}#g
" /usr/local/etc/php/php-fpm.d/www.conf