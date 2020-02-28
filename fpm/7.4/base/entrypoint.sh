#!/bin/sh

cd /data

if [ ! -z $SCRIPTS_DIR ] && [ -d "/data/$SCRIPTS_DIR" ]; then
  echo "Copying custom scripts from /data/$SCRIPTS_DIR"
  cp /data/$SCRIPTS_DIR/* /scripts
fi

for filename in /scripts/*.sh; do
    if [ -f $filename ]; then
        sh $filename
    fi
done

exec php-fpm
