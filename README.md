# Enhanced dockerized PHP 🐳🐘
> PHP images for local, build (ci) and production usage of FPM and CLI

## PHP 7.4

This is the latest supported PHP version.
To read the documentation for older PHP releases see one of the ongoing branches:

- [PHP 7.3](https://github.com/liteacz/php/tree/7.3)

## Documentation 📖

Documentation is located in the [docs](./docs) directory of this repository.

## Content 📜

- [About](#About)
- [Getting started](#Getting-started)
    - [Using FPM](#using-fpm)
    - [Using CLI](#using-cli)
- [Demo time](#demo-time)

## About ℹ️

In our day to day work, we maintain a lot of **dockerized** (mostly PHP) projects.
The dockerization itself is rather straightforward, but with every new project the process of dockerzing is quite **repetitive**, so we extracted the most common settings and extensions
and created this set of images.

Hopefully it can be helpful to someone else struggling with similar problems.

This repository contains both **cli** and **fpm** versions of the [official PHP images](https://hub.docker.com/_/php). The main focus is on the **fpm** version which usually needs more boilerplate compared to the **cli** one.

The **fpm** image is meant to play well with our [nginx](https://github.com/liteacz/nginx), but it can be used by any other webserver that supports [fastcgi](https://en.wikipedia.org/wiki/FastCGI).

For more information see the [documentation](./docs) which is part of this repository in [docs](./docs) directory.

## Getting started

### Using FPM
Assuming the following project structure, here is simple `docker-compose.yml` example that shows how to use the **fpm** and [nginx](github.com/liteacz/nginx) images together for local development.

```
myproject
├── app
│   └── MyController.php
├── docker-compose.yml
└── public
    └── index.php
```

**docker-compose.yml**

```yml
version: "3"
services:
  nginx:
    image: liteacz/nginx:1.17
    environment:
      NGINX_ROOT_DIR: public
    ports:
      - 8000:80
    volumes:
      - ./public:/var/www/data/public
    depends_on:
      - php-fpm
  php-fpm:
    image: liteacz/php:7.4-fpm-dev
    environment:
      FPM_ROOT_DIR: public
    volumes:
      - ./:/var/www/data
```

Now when you call `docker-compose up -d` from within `myproject` folder you'll see something similar to:

```bash
$ myproject docker-compose up -d
Creating network "myproject_default" with the default driver
Creating myproject_php-fpm_1 ... done
Creating myproject_nginx_1   ... done
```

**Note**

> If you don't have php and nginx images pulled locally, the first run will take some time to pull them. The subsequent start (`docker-compose up -d`) will be faster.


Now verify that both nginx and php-fpm containers are up and running:

```bash
$ docker ps -a
CONTAINER ID        IMAGE                     COMMAND                  CREATED             STATUS              PORTS                  NAMES
bf29810d03ba        liteacz/nginx:1.17        "/var/www/entrypoint…"   2 seconds ago       Up 1 second         0.0.0.0:8000->80/tcp   myproject_nginx_1
a70de460d91f        liteacz/php:7.4-fpm-dev   "docker-php-entrypoi…"   3 seconds ago       Up 2 seconds        9000/tcp               myproject_php-fpm_1
```

If you see "Up ..." within the "STATUS" column you should be able to navigate to [localhost:8000](http://localhost:8000) and see the "Hello dockerized PHP world!" message.

### Using CLI

For starters, you might just output the php info to the terminal:

```bash
$ docker run -it --rm liteacz/php:7.4-cli-dev php -i
phpinfo()
PHP Version => 7.4.2

System => Linux 89014fe2f832 5.3.0-46-generic #38-Ubuntu SMP Fri Mar 27 17:37:05 UTC 2020 x86_64
Build Date => Jan 24 2020 07:10:24
...
```

## Demo time

If you don't feel like setting up the project structure yourself,
try out our [dockerized hello world example](https://github.com/liteacz/hello-dockerized-world)
and get started in three simple steps (really, it's just `git pull`, `cd hello-dockerized-world` and `docker-compose up -d`).
All you need is [docker installed](https://docs.docker.com/get-docker/) on your machine

I would not count the `cd` as a single step myself, but who would believe in two commands setup?
