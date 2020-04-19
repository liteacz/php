#!/bin/sh

IDE_SERVER_NAME="docker"
SCRIPT_PATH="$1"

# When second parameter is provided
# the first one becomes the server name
# and the second one becomes the path to the
# php script to be executed.
if [ ! -z "$2" ]; then
  SCRIPT_PATH="$2"
  IDE_SERVER_NAME="$1"
fi

export XDEBUG_CONFIG=""
export PHP_IDE_CONFIG="serverName=$IDE_SERVER_NAME"

php "$SCRIPT_PATH"