# PHP 7.4 FPM

## Table of contents

- [What is FPM?](#what-is-fpm)
- [Basic usage](#basic-usage)
- [Not so basic usage](#not-so-basic-usage)
- [Available environment variables and build arguments](#available-environment-variables-and-build-arguments)

## What is FPM?

TODO: Little bit of theory and references regarding FPM will be here. 

## Basic usage

TODO

## Not so basic usage

TODO:
Dockerized laravel
Usage with gitlab ci

## Available environment variables and build arguments

### Base image

| Variable name            | Default Value        | Type      | Description    |
| ---------------------    | ----------------     | --------- | -------------- |
| `$FPM_ROOT_DIR`          | public               | Env       | Sets fpm root directory |
| `$UID`                   | n/a                  | Env       | The www-data user will be recreated with given UID. Useful for local development so both host user (you) and www-data have same UID (resolves permission issues on shared volumes). |
| `$CHOWN_DATA`            | n/a                  | Env       | When set, `/var/www/data` directory will be `chown`ed to www-data user |

### Build image

All variables from [Base image](#base-image) and:

| Variable name                         | Default Value        | Type            | Description    |
| ------------------------------------- | ----------------     | --------------- | -------------- |
| `$PRIVATE_REPOSITORY_SSH_KEY`         | n/a                  | Runtime/Build   | SSH key to use to connect to the private repository server |
| `$PRIVATE_REPOSITORY_SERVER_URL`      | n/a                  | Runtime/Build   | URL of the private repository server |
| `$PRIVATE_REPOSITORY_SERVER_PORT`     | 22                   | Runtime/Build   | SSH port on the private repository server |

### Dev image

All variables from [Base image](#base-image), [Build image](#build-image) and:

| Variable name               | Default Value        | Type            | Description    |
| --------------------------  | ----------------     | --------------- | -------------- |
| `$RUN_COMPOSER`             | 0                    | Runtime         | When set to 1, composer packages will be installed when container starts |
| `$XDEBUG_EXENSION_PATH`     | xdebug.so            | Runtime         | Sets zend_extension config value |
| `$XDEBUG_ENABLE`            | 1                    | Runtime         | Sets xdebug.remote_enable config value |
| `$XDEBUG_AUTOSTART`         | 0                    | Runtime         | Sets xdebug.remote_autostart config value |
| `$XDEBUG_PORT`              | 9000                 | Runtime         | Sets xdebug.port config value |
| `$XDEBUG_IDEKEY`            | docker               | Runtime         | Sets xdebug.idekey config value         |
| `$XDEBUG_HANDLER`           | dbgp                 | Runtime         | Sets xdebug.remote_handler config value |
| `$XDEBUG_CONNECT_BACK`      | 0                    | Runtime         | Sets xdebug.connect_back config value |
| `$XDEBUG_HOST`              | Guessed ip address   | Runtime         | Sets xdebug.host config value |
