FROM $PARENT_IMAGE

ARG PRIVATE_REPOSITORY_SSH_KEY
ARG PRIVATE_REPOSITORY_SERVER_URL

ENV PRIVATE_REPOSITORY_SSH_KEY ${PRIVATE_REPOSITORY_SSH_KEY}
ENV PRIVATE_REPOSITORY_SERVER_URL ${PRIVATE_REPOSITORY_SERVER_URL}

ARG PRIVATE_REPOSITORY_SERVER_PORT
ENV PRIVATE_REPOSITORY_SERVER_PORT ${PRIVATE_REPOSITORY_SERVER_PORT}

ENV COMPOSER_HOME=/composer

COPY --from=composer /usr/bin/composer /usr/local/bin/
RUN composer global require hirak/prestissimo

RUN \
    # Persistant libs
    apk add --no-cache \
      git \
      openssh-client

RUN \
    echo "Checking private repository variables" \
    && PRSK="$PRIVATE_REPOSITORY_SSH_KEY" \
    && PRSU="$PRIVATE_REPOSITORY_SERVER_URL" \
    && [ -z "$PRIVATE_REPOSITORY_SERVER_PORT" ] && PRSP="2222" || PRSP="$PRIVATE_REPOSITORY_SERVER_PORT"; \
    if [ ! -z "$PRSK" ] && [ ! -z "$PRSU" ]; then \
        echo "Both PRIVATE_REPOSITORY_SSH_KEY and PRIVATE_REPOSITORY_SERVER_URL are set." \
        && echo "$PRSU" \
        && mkdir -m 0700 /root/.ssh \
        && echo "Adding private repository address to known_hosts." \
        && ssh-keyscan -p "$PRSP" "$PRSU" > /root/.ssh/known_hosts \
        && echo "Adding private repository deploy key for user." \
        && echo "$PRSK" > /root/.ssh/id_rsa \
        && echo "Securing .ssh directory" \
        && chown -R root:root /root/.ssh \
        && chmod 0600 /root/.ssh/*; \
    fi
