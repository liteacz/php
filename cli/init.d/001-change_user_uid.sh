#!/bin/sh

if [[ ! -z "${USER_ID}" ]] ; then
    echo "USER_ID specified: ${USER_ID}"

    if id www-data >/dev/null 2>&1; then
	    echo "Found user www-data, deleting..."
        deluser www-data
    fi

    echo "Creating new user www-data"

    # -D Don't assign password
    # -H Don't create home directory
    # -g GECOS field
    adduser \
        -u "${USER_ID}" \
        -D \
        -H \
        -g "" \
    www-data

    # Create composer cache directory
    mkdir -p /home/www-data/.composer/cache/vcs

    # Change ownership of the home directory
    chown -R www-data:www-data /home/www-data
fi
