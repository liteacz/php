#!/bin/sh

if [[ ! -z "${UID}" ]] ; then
    echo "Warning: UID env variable has been deprecated and will be removed in future releases. Use FPM_USER_ID instead."

    FPM_USER_ID="${UID}"
fi

if [[ ! -z "${FPM_USER_ID}" ]] ; then
    echo "FPM_USER_ID specified: ${FPM_USER_ID}"

    if id www-data >/dev/null 2>&1; then
	    echo "Found user www-data, deleting..."
        deluser www-data
    fi

    echo "Creating new user www-data"

    # -D Don't assign password
    # -H Don't create home directory
    # -g GECOS field
    adduser \
        -u "${FPM_USER_ID}" \
        -D \
        -H \
        -g "" \
    www-data

    # Create composer cache directory
    mkdir -p /home/www-data/.composer/cache/vcs

    # Change ownership of the home directory
    chown -R www-data:www-data /home/www-data
fi
