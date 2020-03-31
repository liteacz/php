# Table of contents

## Content

- [Available environment variables](#Available-environment-variables)

## Available environment variables

| Variable name            | Images        | Required   | Default Value        | Description    |
| ---------------------    | ------------- | ---------- | ----------------     | -------------- |
| `$FPM_ROOT_DIR`          | All           | false      | public               | Sets fpm root directory |
| `$RUN_COMPOSER`          | Dev           | false      | 0                    | When set to 1, composer packages will be installed on image start |
| `$UID`                   | All           | false      | n/a                  | When set, www-data user will be recreated with given UID. Useful for local development so both host user (you) and www-data have same UID (resolves permission issues on shared volumes). |
| `$CHOWN_DATA`            | All           | false      | n/a                  | When set `/var/www/data` directory will be `chown`ed to www-data user |
| `$XDEBUG_ENABLE`         | Dev           | false      | 1                    | Sets xdebug.remote_enable and xdebug.remote_autostart config values |
| `$XDEBUG_PORT`           | Dev           | false      | 9000                 | Sets xdebug.port config value |
| `$XDEBUG_IDEKEY`         | Dev           | false      | docker               | Sets xdebug.idekey config value |
| `$XDEBUG_HANDLER`        | Dev           | false      | dbgp                 | Sets xdebug.remote_handler config value |
| `$XDEBUG_CONNECT_BACK`   | Dev           | false      | 0                    | Sets xdebug.connect_back config value |
| `$XDEBUG_HOST`           | Dev           | false      | Guessed ip address   | Sets xdebug.host config value |
