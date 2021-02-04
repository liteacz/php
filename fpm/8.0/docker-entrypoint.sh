#!/bin/sh

mkdir -p /var/www/data
cd /project/

[[ -z $CUSTOM_SCRIPTS_PATH ]] && CUSTOM_SCRIPTS_PATH="/var/www/user-init.d"

if [[ -d $CUSTOM_SCRIPTS_PATH ]]; then
  cp -r "$CUSTOM_SCRIPTS_PATH/." /var/www/init.d
fi

for filename in /var/www/init.d/*.sh; do
    if [[ -f $filename ]]; then
        sh $filename
    fi
done

exec "$@"