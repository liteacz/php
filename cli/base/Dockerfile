FROM $PARENT_IMAGE

COPY base/scripts /var/www/scripts/

COPY base/entrypoint.sh /var/www
RUN chmod +x /var/www/entrypoint.sh

ENTRYPOINT ["/var/www/entrypoint.sh"]