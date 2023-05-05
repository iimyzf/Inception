#!/bin/sh

# Delete existing WordPress files if they exist
if [ -d "/var/www/html" ]; then
	rm -rf /var/www/html
fi

# Create a new WordPress site
wp core download --allow-root --version=5.8.1 --locale=en_US
wp config create --allow-root --dbname=${WORDPRESS_DB_NAME} --dbuser=${WORDPRESS_DB_USER} --dbpass=${WORDPRESS_DB_PASSWORD} --dbhost=${WORDPRESS_DB_HOST}
wp core install --allow-root --url=${WORDPRESS_URL} --title=${WORDPRESS_TITLE} --admin_user=${WORDPRESS_ADMIN_USER} --admin_password=${WORDPRESS_ADMIN_PASSWORD} --admin_email=${WORDPRESS_ADMIN_EMAIL}
