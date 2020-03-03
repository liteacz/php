# Enhanced dockerized PHP 🐳🐘
> PHP images for local, build (ci) and production usage of FPM and CLI

## Documentation 📖

Documentation is located in the [docs](./docs) directory of this repository.

## Content 📜

- [About](#About)
- [Getting started](#Getting-started)

## About ℹ️

In our day to day work, we maintain a lot of **dockerized** (mostly PHP) projects.
The dockerization itself is rather straightforward, but with every new project the process of dockerzing is quite **repetitive**, so we extracted the most common settings and extensions
and created this set of images.

Hopefully it can be helpful to someone else struggling with similar problems.

This repository contains both **cli** and **fpm** versions of the [official PHP images](https://hub.docker.com/_/php). The main focus is on the **fpm** version which usually needs more boilerplate compared to the **cli** one.

The **fpm** image is meant to play well with our [nginx](https://github.com/liteacz/nginx), but it can be used by any other webserver that supports [fastcgi](https://en.wikipedia.org/wiki/FastCGI).

For more information see the [documentation](./docs) which is part of this repository in [docs](./docs) directory.

## Getting started

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
      UID: 1000
      FPM_ROOT_DIR: public
    volumes:
      - ./:/var/www/data
```

Now when you call `docker-compose up -d` from within `myproject` folder you'll see something similar to:

```bash
➜  myproject docker-compose up -d
Creating network "myproject_default" with the default driver
Creating myproject_php-fpm_1 ... done
Creating myproject_nginx_1   ... done
```

If you don't have php and nginx images pulled locally, the first run will take some time to pull them. The subsequent start (`docker-compose up -d`) will be faster.
