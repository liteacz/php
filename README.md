# Litea PHP
> Enhanced dockerized PHP images for local, build (ci) and production usage

## Available environment variables

| Variable name            | Images        | Required   | Default Value    | Description    |
| ---------------------    | ------------- | ---------- | ---------------- | -------------- |
| `$FPM_ROOT_DIR`          | All           | false      | www              | Sets fpm root directory |
| `$RUN_COMPOSER`          | Only dev      | false      | 0                | When set to 1, composer packages will be installed on image start |
| `$UID`                   | All           | false      | n/a              | When set, www-data user will be recreated with given UID. Useful for local development so both host user (you) and www-data have same UID (resolves permission issues on shared volumes). |
| `$CHOWN_DATA`            | All           | false      | n/a              | When set `/data` directory will be `chown`ed to www-data user |
| `$XDEBUG_ENABLE`         | Only dev      | false      | 1                | Sets xdebug.remote_enable and xdebug.remote_autostart config values |
| `$XDEBUG_PORT`           | Only dev      | false      | 9999             | Sets xdebug.port config value |
| `$XDEBUG_IDEKEY`         | Only dev      | false      | docker           | Sets xdebug.idekey config value |
| `$XDEBUG_HANDLER`        | Only dev      | false      | dbgp             | Sets xdebug.remote_handler config value |
| `$XDEBUG_CONNECT_BACK`   | Only dev      | false      | 0                | Sets xdebug.connect_back config value |
| `$XDEBUG_HOST`           | Only dev      | false      | 0                | Sets xdebug.host config value |
