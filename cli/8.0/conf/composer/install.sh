#!/bin/sh

current_dir="${0%/*}"
container_init_directory="${1}"

echo "Copying composer initial scripts to the global init directory"
cp -R "${current_dir}/init.d/." "${container_init_directory}"

echo "Installing git and ssh client"
apk add --no-cache git openssh-client

if [[ "${?}" != 0 ]]; then
    exit 1
fi

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"

php -r "
    \$hash = '906a84df04cea2aa72f40b5f787e49f22d4c2f19492ac310e8cba5b96ac8b64115ac402c8cd292b8a03482574915d1a8';

    if (hash_file('sha384', 'composer-setup.php') === \$hash) {
        echo 'Installer verified' . PHP_EOL;
        exit(0);
    } else {
        echo 'Installer corrupt' . PHP_EOL;
        unlink('composer-setup.php');
        exit(1);
    }

    echo PHP_EOL;
"

if [[ "${?}" != 0 ]]; then
    exit 1
fi

php composer-setup.php
php -r "unlink('composer-setup.php');"

mv composer.phar /usr/local/bin/composer
