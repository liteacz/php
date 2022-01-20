#!/bin/sh

current_dir="${0%/*}"
container_init_directory="${1}"

echo "Copying composer initial scripts to the global init directory"
cp -R "${current_dir}/init.d/." "${container_init_directory}"

install-php-extensions @composer-^2
