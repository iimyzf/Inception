#!/bin/sh

# Delete existing WordPress files if they exist
# if [ -d "/var/www/html" ]; then
# 	rm -rf /var/www/html
# fi

# Create a new WordPress site
# wp core download --allow-root --version=5.8.1 --locale=en_US
# wp config create --allow-root --dbname=${WORDPRESS_DB_NAME} --dbuser=${WORDPRESS_DB_USER} --dbpass=${WORDPRESS_DB_PASSWORD} --dbhost=${WORDPRESS_DB_HOST}
# wp db create --allow-root
# wp core install --allow-root --url=${WORDPRESS_URL} --title=${WORDPRESS_TITLE} --admin_user=${WORDPRESS_ADMIN_USER} --admin_password=${WORDPRESS_ADMIN_PASSWORD} --admin_email=${WORDPRESS_ADMIN_EMAIL}

# if WordPress files seem to already be present, then just update the site
# if [ -d "/var/www/html/wordpress" ]; then
# 	wp core update --allow-root --version=5.8.1 --locale=en_US
# fi

# if the wordpress folder already exists, then remove it and create a new one
# if [ -d "/var/www/html/wordpress" ];
# then
# 	rm -rf /var/www/html/wordpress
# else


# if the wp-config.php file already exists, then remove it
# if [ -f "/var/www/html/wp-config.php" ]; then
# 	rm -rf /var/www/html/wp-config.php
# fi

# copy the wp-config.php file to the correct location
if [ -d "/var/www/html/wordpress" ];
then
	rm -rf /var/www/html/wordpress
else

# cp /tmp/wp-config.php /var/www/html/wp-config.php

wp core download --path=/var/www/html --allow-root --version=5.8.1 --locale=en_US
wp config create --allow-root --dbname=${WP_NAME} --dbuser=${WP_USER} --dbpass=${WP_PASSWORD} --dbhost=${WP_HOST}
wp db create --allow-root
wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL}

fi