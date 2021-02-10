#!/bin/sh

case "${1}" in
    "build-local")
        type="${2}"
        version="${3}"

        docker build \
            -t "liteacz/php:${version}-${type}-local" \
            -f "${type}/${version}/Dockerfile" \
        .
    ;;

    "run-local")
        type="${2}"
        version="${3}"
        shift 3
        cmd=${@}

        docker run \
            -it \
            --rm \
            "liteacz/php:${version}-${type}-local" \
            ${cmd}
        ;;
esac