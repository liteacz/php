#!/bin/sh

[[ -z "${APP_DIR}" ]] && APP_DIR="/var/www"
[[ -z "${INIT_DIR}" ]] && INIT_DIR="/opt/litea/init.d"

mkdir -p "${APP_DIR}"
cd "${APP_DIR}"

[[ -z "${CUSTOM_SCRIPTS_PATH}" ]] && CUSTOM_SCRIPTS_PATH="/opt/litea/user-init.d"

if [[ -d "${CUSTOM_SCRIPTS_PATH}" ]]; then
  cp -r "${CUSTOM_SCRIPTS_PATH}/." "${INIT_DIR}"
fi

for filename in "${INIT_DIR}/*.sh"; do
    if [[ -f "${filename}" ]]; then
        sh "${filename}"

        if [[ "${?}" != 0 ]]; then
            echo "ERROR: init script ${filename} exitted with non-zero code"
            exit 1
        fi
    fi
done

exec "${@}"