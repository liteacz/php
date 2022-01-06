# PHP images ready to go

## PHP 8.1

You are browsing documentation for PHP 8.1.

You might be also looking for
- [8.0](https://github.com/liteacz/php/tree/8.0)
- [7.4](https://github.com/liteacz/php/tree/7.4)
- [7.3](https://github.com/liteacz/php/tree/7.3)

for more info.

## TL;DR

```bash
# Verify docker and docker-compose
$ docker --version && docker-compose --version
Docker version 18.09.5, build e8ff056
docker-compose version 1.23.2, build 1110ad01

# Try our dockerized demo app
$ git clone git@github.com:liteacz/hello-dockerized-world.git
$ cd hello-dockerized-world/examples/php
$ docker-compose up -d
# Open up the page in your favorite browser
$ firefox localhost:8000
# That's it!
```

## Content

- [About](#about)
- [Getting started](#getting-started)
- [Demo](#demo-time)
- [Configuration](#configuration)

## About

In our day to day work, we maintain a lot of **dockerized** (mostly PHP) projects. The dockerization itself is rather straightforward, but with every new project the process of dockerzing is quite **repetitive**, so we extracted the most common settings and extensions and created this set of images.

Hopefully it can be useful to someone else struggling with similar problems.

This repository contains both **cli** and **fpm** versions of the [official PHP images](https://hub.docker.com/_/php). The main focus is on the fpm version which usually needs more boilerplate compared to the **cli** one.

The fpm image is meant to play well with our [nginx](https://github.com/liteacz/nginx), but it can be used by any other webserver that supports [fastcgi](https://en.wikipedia.org/wiki/FastCGI).

## Getting started

### Using FPM

Assuming the following project structure, here is simple `docker-compose.yml` example that shows how to use the **fpm** and [nginx](https://github.com/liteacz/php/blob/7.4/github.com/liteacz/nginx) images together for local development.

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
    image: liteacz/nginx:1.19
    ports:
      - 8000:80
    volumes:
      - ./public:/var/www/public
    depends_on: 
      - php-fpm
    
  php-fpm:
    image: liteacz/php:8.1-fpm
      environment:
        FPM_ROOT_DIR: public
      volumes:
        - .:/var/www
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

CONTAINER ID        IMAGE                 COMMAND                  CREATED             STATUS              PORTS                  NAMES
74bd21e8c4d8        liteacz/nginx:1.19    "docker-entrypoint n…"   12 seconds ago      Up 11 seconds       0.0.0.0:8000->80/tcp   myproject_nginx_1
1548c43f6aca        liteacz/php:8.0-fpm   "docker-entrypoint p…"   13 seconds ago      Up 11 seconds       9000/tcp               myproject_php-fpm_1
```

If you see "Up ..." within the "STATUS" column you should be able to navigate to [localhost:8000](http://localhost:8000) and see the "Hello dockerized PHP world!" message.

### Using CLI

TODO

## Demo time

If you don't feel like setting up the project structure yourself,
try out our [dockerized hello world example](https://github.com/liteacz/hello-dockerized-world)
and get started in three simple steps (really, it's just `git pull`, `cd hello-dockerized-world` and `docker-compose up -d`).
All you need is [docker installed](https://docs.docker.com/get-docker/) on your machine.

I would not count the `cd` as a single step myself, but who would believe in two commands setup?

## Configuration

Even though the basic examples work out of the box, in real life situations you might want to configure your container. Here are some of the often use-cases that might address your problem.

### List of available packages

TODO