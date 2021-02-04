#!/bin/sh

current_dir="${0%/*}"
container_init_directory="${1}"

echo "Copying composer initial scripts to the global init directory"
cp -R "${current_dir}/init.d/." "${container_init_directory}"

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"

php -r "
    \$hash = '756890a4488ce9024fc62c56153228907f1545c228516cbf63f885e036d37e9a59d27d63f46af1d4d07ee0f76181c7d3';

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