FROM $PARENT_IMAGE

COPY dev/scripts /var/www/scripts/

COPY base/entrypoint.sh /var/www
RUN chmod +x /var/www/entrypoint.sh

ENTRYPOINT ["/var/www/entrypoint.sh"]