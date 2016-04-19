FROM weyforth/wordpress:4.5.0-apache

COPY sage /app/themes/sage
COPY dokku/wordpress-entrypoint.sh /wordpress-entrypoint.sh
COPY dokku/nginx.conf.sigil /var/www/html/nginx.conf.sigil
COPY dokku/CHECKS /app/CHECKS

EXPOSE 80

ENTRYPOINT ["/wordpress-entrypoint.sh"]
CMD []
