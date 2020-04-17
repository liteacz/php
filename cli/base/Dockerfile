FROM $PARENT_IMAGE

COPY base/scripts /var/www/scripts/
COPY base/entrypoint.sh /var/www
COPY base/loop.sh /usr/local/bin/loop

RUN chmod +x /var/www/entrypoint.sh /usr/local/bin/loop

ENTRYPOINT ["/var/www/entrypoint.sh"]