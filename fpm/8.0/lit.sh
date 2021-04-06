#!/bin/sh
# lit.sh v1.0.0

# https://google.github.io/styleguide/shellguide.html#s7-naming-conventions

CONTAINER_INIT_DIRECTORY="/opt/litea/init.d"
LITEA_INSTALLED_PACKAGES="/opt/litea/installed_packages.txt"

function phpize_add {
    apk add --no-cache --virtual .phpize-deps $PHPIZE_DEPS
}

function phpize_remove {
    apk del --no-cache .phpize-deps
}

function add_php_ext_gd {
    echo "Installing GD php extension" \
        && apk add --no-cache \
            libpng-dev \
            freetype-dev \
            libjpeg-turbo-dev \
        && docker-php-ext-configure gd \
            --with-jpeg \
            --with-freetype \
        && NPROC=$(getconf _NPROCESSORS_ONLN) \
        && docker-php-ext-install -j${NPROC} gd
}

function add_php_ext_redis {
    echo "Installing redis php extension" \
        && pecl install redis \
        && docker-php-ext-enable redis
}

function preset_laravel {
    echo "Installing required system libraries and php extensions" \
        && phpize_add \
        && apk add --no-cache --virtual .build-deps \
            zlib-dev \
            oniguruma-dev \
        && apk add --no-cache --virtual .persistent-deps \
            libzip-dev \
            libxml2-dev \
        && docker-php-ext-install \
            bcmath \
            calendar \
            opcache \
            pdo_mysql \
            zip \
        && add_php_ext_redis \
        && add_php_ext_gd \
        && echo "Cleaning build dependencies" \
        && apk del --no-cache .build-deps \
        && phpize_remove
}

# ================= #
# ===  HELPERS  === #
# ================= #

function error {
    RED='\033[0;31m'
    NC='\033[0m' # No Color

    echo -e "${RED}ERROR${NC}: ${1}"
}

function warning {
    ORANGE='\033[0;33m'
    NC='\033[0m' # No Color

    echo -e "${ORANGE}WARNING${NC}: ${1}"
}

function success {
    GREEN='\033[1;32m'
    NC='\033[0m' # No Color

    echo -e "${GREEN}SUCCESS${NC}: ${1}"
}

function install_package {
    pkg="${1}"
    touch "${LITEA_INSTALLED_PACKAGES}"

    if grep -Fxq "${pkg}" "${LITEA_INSTALLED_PACKAGES}"; then
        warning "the package ${pkg} has already been installed"
        exit 0
    fi


    echo "Installing ${pkg}"

    pkg_conf_path="/opt/litea/conf/${pkg}"

    if [[ ! -d "${pkg_conf_path}" ]]; then
        error "Configuration folder for the package ${pkg} was not found"
        exit 1
    fi

    pkg_install_script="${pkg_conf_path}/install.sh"

    if [[ ! -f "${pkg_install_script}" ]]; then
        error "Installation script for the package ${pkg} was not found"
        exit 1
    fi

    sh "${pkg_install_script}" "${CONTAINER_INIT_DIRECTORY}"

    if [[ "${?}" != 0 ]]; then
        error "${pkg} installation failed"
        exit 1
    fi

    success "${pkg} installed successfully"

    echo "${pkg}" >> "${LITEA_INSTALLED_PACKAGES}"
}

# ================== #
# ===  COMMANDS  === #
# ================== #

case "${1}" in
    "install")
        shift 1

        for pkg in "${@}"
        do
            install_package "${pkg}"

            if [[ "${?}" != 0 ]]; then
                exit 1
            fi
        done
    ;;

    "preset")
        shift 1

        case "${1}" in
            "laravel")
                echo "Installing Laravel production preset"

                preset_laravel \
                    && install_package fpm

                if [[ "${?}" != 0 ]]; then
                    exit 1
                fi
                ;;
        esac
        ;;
esac
