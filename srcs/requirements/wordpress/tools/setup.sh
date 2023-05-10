#!/bin/sh

if [ ! -d "/var/www/html" ]; then
  mkdir -p /var/www/html
fi

cd /var/www/html
sleep 5
  wp core download --allow-root --version=5.8.1 --locale=en_US
  wp config create --allow-root --dbname=${WP_NAME} --dbuser=${WP_USER} --dbpass=${WP_PASSWORD} --dbhost=${WP_HOST} 
#   wp db create --allow-root
  wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL}

exec php-fpm7 -F -R 