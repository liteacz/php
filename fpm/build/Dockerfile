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

RUN apk add --no-cache \
      git \
      openssh-client

COPY build/add_private_repository.sh /usr/local/bin

RUN chmod +x /usr/local/bin/add_private_repository.sh \
    && /usr/local/bin/add_private_repository.sh
