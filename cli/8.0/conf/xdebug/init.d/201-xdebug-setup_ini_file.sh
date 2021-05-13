#!/bin/sh

HOST_IP=$(ip route show default | awk '/default/ {print $3}')

[[ -z "${XDEBUG_EXTENSION_PATH}" ]] && XDEBUG_EXTENSION_PATH="xdebug.so"

[[ -z "${XDEBUG_REMOTE_ENABLE}" ]] && XDEBUG_REMOTE_ENABLE="1"
[[ -z "${XDEBUG_REMOTE_AUTOSTART}" ]] && XDEBUG_REMOTE_AUTOSTART="0"
[[ -z "${XDEBUG_REMOTE_PORT}" ]] && XDEBUG_REMOTE_PORT="9000"
[[ -z "${XDEBUG_REMOTE_HANDLER}" ]] && XDEBUG_REMOTE_HANDLER="dbgp"
[[ -z "${XDEBUG_REMOTE_CONNECT_BACK}" ]] && XDEBUG_REMOTE_CONNECT_BACK="0"
[[ -z "${XDEBUG_REMOTE_HOST}" ]] && XDEBUG_REMOTE_HOST="${HOST_IP}"

[[ -z "${XDEBUG_IDEKEY}" ]] && XDEBUG_IDEKEY="docker"

[[ -z "${XDEBUG_PROFILER_OUTPUT_DIR}" ]] && XDEBUG_PROFILER_OUTPUT_DIR="/tmp"
[[ -z "${XDEBUG_PROFILER_OUTPUT_NAME}" ]] && XDEBUG_PROFILER_OUTPUT_NAME="cachegrind.out.%p-%H-%R"
[[ -z "${XDEBUG_PROFILER_ENABLE_TRIGGER}" ]] && XDEBUG_PROFILER_ENABLE_TRIGGER="1"
[[ -z "${XDEBUG_PROFILER_ENABLE}" ]] && XDEBUG_PROFILER_ENABLE="0"

sed -e "
s/%xdebug_extension_path%/${XDEBUG_EXTENSION_PATH}/g
s/%xdebug_remote_enable%/${XDEBUG_REMOTE_ENABLE}/g
s/%xdebug_remote_autostart%/${XDEBUG_REMOTE_AUTOSTART}/g
s/%xdebug_remote_port%/${XDEBUG_REMOTE_PORT}/g
s/%xdebug_remote_host%/${XDEBUG_REMOTE_HOST}/g
s/%xdebug_remote_handler%/${XDEBUG_REMOTE_HANDLER}/g
s/%xdebug_connect_back%/${XDEBUG_REMOTE_CONNECT_BACK}/g
s/%xdebug_ide_key%/${XDEBUG_IDEKEY}/g
s#%xdebug_profiller_output_dir%#${XDEBUG_PROFILER_OUTPUT_DIR}#g
s/%xdebug_profiller_output_name%/${XDEBUG_PROFILER_OUTPUT_NAME}/g
s/%xdebug_profiller_enable_trigger%/${XDEBUG_PROFILER_ENABLE_TRIGGER}/g
s/%xdebug_profiller_enable%/${XDEBUG_PROFILER_ENABLE}/g
" /opt/litea/conf/xdebug/xdebug.ini > \
    /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
