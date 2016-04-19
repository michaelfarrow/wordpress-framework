#!/bin/bash

set -e

# [ ! -f nginx.conf.sigil ] || rm nginx.conf.sigil

mkdir -p /var/www/html/wp-content/themes/

WP_THEME_DIR="/var/www/html/wp-content/themes"

if [ -d /app/themes/sage ]; then

  # remove any remnants of other deployments
  rm -rf "$WP_THEME_DIR/sage-new"
  rm -rf "$WP_THEME_DIR/sage-old"

  # move new theme into place
  mv /app/themes/sage "$WP_THEME_DIR/sage-new"

  # if an old theme exists, move it out of the way
  [ ! -d "$WP_THEME_DIR/sage" ] || mv "$WP_THEME_DIR/sage" "$WP_THEME_DIR/sage-old"

  # promote new theme
  mv "$WP_THEME_DIR/sage-new" "$WP_THEME_DIR/sage"

  # remove old theme
  rm -rf "$WP_THEME_DIR/sage-old"

fi

chown -R www-data:www-data /var/www/html/wp-content

/entrypoint.sh apache2-foreground
