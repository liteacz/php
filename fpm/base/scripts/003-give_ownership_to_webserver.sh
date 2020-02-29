#!/bin/sh

# Find files not owned by webserver
# and give the ownership to it
if [ ! -z $CHOWN_DATA ]; then
    find . \! -user www-data -exec chown www-data:www-data {} +
fi
