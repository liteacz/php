# PHP 7.4 CLI

## Table of contents

- [What is CLI?](#what-is-cli)
- [Basic usage](#basic-usage)
- [Not so basic usage](#not-so-basic-usage)
- [Available environment variables and build arguments](#available-environment-variables-and-build-arguments)

## What is CLI?

TODO

## Basic usage

TODO

## Not so basic usage

## Available environment variables and build arguments

### Base image

| Variable name            | Default Value        | Type      | Description    |
| ---------------------    | ----------------     | --------- | -------------- |
| No variables available                                                       |

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
| `$XDEBUG_EXENSION_PATH`     | xdebug.so            | Runtime         | Sets zend_extension config value |
| `$XDEBUG_ENABLE`            | 1                    | Runtime         | Sets xdebug.remote_enable config value |
| `$XDEBUG_AUTOSTART`         | 0                    | Runtime         | Sets xdebug.remote_autostart config value |
| `$XDEBUG_PORT`              | 9000                 | Runtime         | Sets xdebug.port config value |
| `$XDEBUG_IDEKEY`            | docker               | Runtime         | Sets xdebug.idekey config value         |
| `$XDEBUG_HANDLER`           | dbgp                 | Runtime         | Sets xdebug.remote_handler config value |
| `$XDEBUG_CONNECT_BACK`      | 0                    | Runtime         | Sets xdebug.connect_back config value |
| `$XDEBUG_HOST`              | Guessed ip address   | Runtime         | Sets xdebug.host config value |
