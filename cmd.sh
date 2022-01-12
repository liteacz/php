#!/bin/sh

version="8.1"

case "${1}" in
    "build-local")
        type="${2}"
        distro="${3}"

        docker build \
            -t "liteacz/php:${version}-${type}-local" \
            -f "${type}/${distro}.Dockerfile" \
        .
    ;;

    "run-local")
        type="${2}"
        distro="${3}"
        shift 3
        cmd=${@}

        docker run \
            -it \
            --rm \
            "liteacz/php:${version}-${type}-local" \
            ${cmd}
        ;;
esac