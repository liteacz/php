#!/bin/sh

HOST_IP=$(ip route show default | awk '/default/ {print $3}')

[ -z "${XDEBUG_EXTENSION_PATH}" ] && XDEBUG_EXTENSION_PATH="xdebug.so"

[ -z "${XDEBUG_MODE}" ] && XDEBUG_MODE="debug"
[ -z "${XDEBUG_START_WITH_REQUEST}" ] && XDEBUG_START_WITH_REQUEST="0"
[ -z "${XDEBUG_CLIENT_PORT}" ] && XDEBUG_CLIENT_PORT="9003"
[ -z "${XDEBUG_REMOTE_HANDLER}" ] && XDEBUG_REMOTE_HANDLER="dbgp"
[ -z "${XDEBUG_DISCOVER_CLIENT_HOST}" ] && XDEBUG_DISCOVER_CLIENT_HOST="0"
[ -z "${XDEBUG_CLIENT_HOST}" ] && XDEBUG_CLIENT_HOST="${HOST_IP}"

[ -z "${XDEBUG_IDEKEY}" ] && XDEBUG_IDEKEY="docker"

[ -z "${XDEBUG_OUTPUT_DIR}" ] && XDEBUG_OUTPUT_DIR="/tmp"
[ -z "${XDEBUG_PROFILER_OUTPUT_NAME}" ] && XDEBUG_PROFILER_OUTPUT_NAME="cachegrind.out.%p-%H-%R"

sed -e "
s/%xdebug_extension_path%/${XDEBUG_EXTENSION_PATH}/g
s/%xdebug_mode%/${XDEBUG_MODE}/g
s/%xdebug_start_with_request%/${XDEBUG_START_WITH_REQUEST}/g
s/%xdebug_client_port%/${XDEBUG_CLIENT_PORT}/g
s/%xdebug_client_host%/${XDEBUG_CLIENT_HOST}/g
s/%xdebug_remote_handler%/${XDEBUG_REMOTE_HANDLER}/g
s/%xdebug_discover_client_host%/${XDEBUG_DISCOVER_CLIENT_HOST}/g
s/%xdebug_ide_key%/${XDEBUG_IDEKEY}/g
s+%xdebug_output_dir%+${XDEBUG_OUTPUT_DIR}+g
s/%xdebug_profiller_output_name%/${XDEBUG_PROFILER_OUTPUT_NAME}/g
" /opt/litea/conf/xdebug/xdebug.ini > \
    /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
