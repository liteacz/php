#!/bin/sh

HOST_IP=$(ip route show default | awk '/default/ {print $3}')

[ -z "$XDEBUG_EXTENSION_PATH" ] && XDEBUG_EXTENSION_PATH="xdebug.so"
[ -z "$XDEBUG_ENABLE" ] && XDEBUG_ENABLE="1"
[ -z "$XDEBUG_AUTOSTART" ] && XDEBUG_AUTOSTART="0"
[ -z "$XDEBUG_PORT" ] && XDEBUG_PORT="9000"
[ -z "$XDEBUG_IDEKEY" ] && XDEBUG_IDEKEY="docker"
[ -z "$XDEBUG_HANDLER" ] && XDEBUG_HANDLER="dbgp"
[ -z "$XDEBUG_CONNECT_BACK" ] && XDEBUG_CONNECT_BACK="0"
[ -z "$XDEBUG_HOST" ] && XDEBUG_HOST="$HOST_IP"

# Replace placeholders with env variables
sed -i -e "
s#\$XDEBUG_EXTENSION_PATH#$XDEBUG_EXTENSION_PATH#g
s#\$XDEBUG_ENABLE#$XDEBUG_ENABLE#g
s#\$XDEBUG_AUTOSTART#$XDEBUG_AUTOSTART#g
s#\$XDEBUG_PORT#$XDEBUG_PORT#g
s#\$XDEBUG_IDEKEY#$XDEBUG_IDEKEY#g
s#\$XDEBUG_HANDLER#$XDEBUG_HANDLER#g
s#\$XDEBUG_CONNECT_BACK#$XDEBUG_CONNECT_BACK#g
s#\$XDEBUG_HOST#$XDEBUG_HOST#g
" /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
