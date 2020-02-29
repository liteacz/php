#!/bin/sh

if [ ! -z "$UID" ] ; then
    echo "UID specified: $UID"

    if id www-data >/dev/null 2>&1; then
	    echo "Found user www-data, deleting..."
        deluser www-data
    fi

    echo "Creating new user www-data"
    adduser -u $UID -D -H -g "" www-data

    # Create composer cache directory
    mkdir -p /home/www-data/.composer/cache/vcs

    # Change ownership of home directory
    chown -R www-data:www-data /home/www-data
fi
