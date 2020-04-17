# PHP 7.4 FPM

## Table of contents

- [What is FPM?](#what-is-fpm)
- [Basic usage](#basic-usage)
- [Not so basic usage](#not-so-basic-usage)
- [Debugging using XDebug](#debugging-using-xdebug)
- [Available environment variables and build arguments](#available-environment-variables-and-build-arguments)

## What is FPM?

TODO: Little bit of theory and references regarding FPM will be here. 

## Basic usage

TODO

## Not so basic usage

TODO:
Dockerized laravel
Usage with gitlab ci

## Debugging using XDebug

When dealing with larger code base the simple `echo $myVar` as a debugging tool
is not the best one to reach for. It pretty much never is, but for many developers (myself included)
it's been THE debugging tool for long part of their programming carriers.

Dockerizing your application, fortunately, does not take this tool away.

The setup is different depending on the IDE or editor you are using. Let's see how this is done
for [PHPStorm](https://www.jetbrains.com/phpstorm/) and [VSCode](https://code.visualstudio.com/).

I'll be using our example [hello dockerized world](https://github.com/liteacz/hello-dockerized-world)
repository, so if you feel like so, grab it and work along to get rid of the `echo $myVar` debugging
"technique".

### Project structure

1. Pull the repository and enter the directory

        $ git pull git@github.com:liteacz/hello-dockerized-world.git
        $ cd hello-dockerized-world

2. Spin up the containers

        $ docker-compose up -d

3. Open the link http://localhost:8000 in your favorite web browser.

4. Verify the directory contents is similar to this:

        $ tree .
        .
        ├── app
        │   └── Realm.php
        ├── docker-compose.yml
        ├── public
        │   └── index.php
        └── README.md

### XDebug with PHPStorm

To be continue...

### XDebug with VSCode

To be continue...

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
