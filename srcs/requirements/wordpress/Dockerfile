# FROM alpine:3.14

# # Install PHP and necessary extensions
# RUN apk update && \
#     apk add curl wget php7 php7-fpm php7-mysqli php7-zlib php7-curl php7-json php7-xml php7-phar php7-intl php7-dom php7-xmlreader php7-ctype php7-session php7-mbstring

# # Copy PHP configuration file
# # COPY ./conf/php-fpm.conf /etc/php7/php-fpm.conf

# # Copy WordPress files to the container
# # COPY wordpress /var/www/html

# # Create a non-root user to run the PHP-FPM process
# # RUN adduser -D -u 1000 -g 'www' www && \
# # 	mkdir -p /var/www/html && \
# #     chown -R www:www /var/www/html && \
# #     mkdir /run/php && \
# #     chown -R www:www /run/php

# # RUN adduser -D -u 1000 -g 'www' www && \
# # 	mkdir -p /var/www/html && \
# # 	wget -q -O - https://wordpress.org/latest.tar.gz | tar -xzf - -C /var/www/html/ && \
# #     chown -R www:www /var/www/html/wordpress/

# RUN mkdir -p /var/www/html && \
# 	curl -o wordpress.tar.gz https://wordpress.org/latest.tar.gz && \
#     tar -xzvf wordpress.tar.gz && \
#     rm -rf wordpress.tar.gz

# #COPY ./conf/wp-config.php /var/www/html/wp-config.php

# EXPOSE 9000

# # Start PHP-FPM
# CMD ["php-fpm7", "-F"]

# # ------------------------------------------------------------------------------------------------------------------------

# FROM alpine:3.14

# RUN apk update && \
#     apk add curl wget unzip php7 php7-fpm php7-mysqli php7-zlib php7-curl php7-json php7-xml php7-phar php7-intl php7-dom php7-xmlreader php7-ctype php7-session php7-mbstring

# RUN addgroup -g 1000 www && \
# 	mkdir -p /var/www/html && \
#     adduser -D -u 1000 -G www -s /bin/sh -h /var/www/html apollo && \
#     chown -R apollo:www /var/www/html && \
#     mkdir /run/php && \
#     chown -R apollo:www /run/php && \
# 	chown -R apollo:www /var/www/html

# USER apollo

# # RUN php -r "copy('https://wordpress.org/latest.tar.gz', 'wordpress.tar.gz');" && \
# # 	# chown apollo:www wordpress.tar.gz && \
# #     tar -xzf wordpress.tar.gz && \
# #     rm wordpress.tar.gz && \
# #     mv wordpress/* /var/www/html/ && \
# #     rm -rf wordpress

# RUN wget -q -O - https://wordpress.org/latest.tar.gz | tar -xzf - -C /var/www/html/ && \
#     chown -R apollo:www /var/www/html/wordpress/

# # COPY ./conf/wp-config.php /var/www/html/wp-config.php

# # RUN php /var/www/html/wp-cli.phar core install --url=localhost --title=MyWebsite --admin_user=admin --admin_password=password --admin_email=admin@example.com && \
# #     php /var/www/html/wp-cli.phar user create user1 user1@example.com --role=author --user_pass=password && \
# #     php /var/www/html/wp-cli.phar user create user2 user2@example.com --role=editor --user_pass=password

# CMD ["php-fpm7", "-F"]

# # ------------------------------------------------------------------------------------------------------------------------

# FROM alpine:3.14

# # Install required packages
# RUN apk update && \
#     # apk add curl php7 php7-fpm php7-mysqli php7-json php7-session php7-phar php7-zlib php7-gd php7-curl php7-zip php7-openssl php7-pdo_mysql php7-iconv php7-xml php7-dom php7-simplexml php7-tokenizer php7-xmlwriter php7-xmlreader
# 	apk add curl php7 php7-fpm php7-mysqli php7-zlib php7-curl php7-json php7-xml php7-phar php7-intl php7-dom php7-xmlreader php7-ctype php7-session php7-mbstring

# # Download and extract WordPress
# RUN mkdir -p /var/www/html && \
# 	curl -o wordpress.tar.gz https://wordpress.org/latest.tar.gz && \
#     tar -xzvf wordpress.tar.gz -C /var/www/html --strip-components=1 && \
#     rm -rf wordpress.tar.gz

# # Set permissions
# RUN chown -R nobody:nobody /var/www/html && \
#     chmod -R 777 /var/www/html

# # Copy PHP configuration files
# COPY ./conf/php-fpm.conf /etc/php7/php-fpm.conf
# COPY ./conf/www.conf /etc/php7/php-fpm.d/www.conf

# # Expose port 9000
# EXPOSE 9000

# # Start PHP-FPM
# CMD ["php-fpm7", "-F"]

# # ------------------------------------------------------------------------------------------------------------------------

FROM alpine:3.14

# Install required packages
RUN apk update && \
    apk add curl php7 php7-fpm php7-mysqli php7-zlib php7-curl php7-json php7-xml php7-phar php7-intl php7-dom php7-xmlreader php7-ctype php7-session php7-mbstring

# Create directories
# RUN mkdir -p /run/php && \
#     mkdir -p /var/www/html && \
#     chown -R nobody:nobody /var/www/html && \
#     chmod -R 777 /var/www/html

RUN mkdir -p /var/www/html/wordpress && \
	sed -i 's#listen = 127.0.0.1:9000#listen = 0.0.0.0:9000#' /etc/php7/php-fpm.d/www.conf

WORKDIR /var/www/html/

# RUN mkdir -p /var/www/html && \
# 	cd /var/www/html
	# curl -o wordpress.tar.gz https://wordpress.org/latest.tar.gz && \
    # tar -xzvf wordpress.tar.gz && \
    # rm wordpress.tar.gz

# Configure PHP-FPM
#COPY ./conf/php-fpm.conf /etc/php7/php-fpm.conf

# Expose ports
EXPOSE 9000 8000

# Start PHP-FPM
CMD ["php-fpm7", "-F"]


# # ------------------------------------------------------------------------------------------------------------------------


# FROM alpine:3.14

# # Install required packages
# RUN apk update && \
# 	apk add curl php7 php7-fpm php7-mysqli php7-zlib php7-curl php7-json php7-xml php7-phar php7-intl php7-dom php7-xmlreader php7-ctype php7-session php7-mbstring mysql-client

# # Install WP-CLI
# RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
#     chmod +x wp-cli.phar && \
#     mv wp-cli.phar /usr/local/bin/wp

# # Download WordPress core files
# RUN mkdir -p /var/www/html && \
# 	cd /var/www/html && \
# 	wp core download --allow-root

# # Copy the wp-config.php file
# COPY ./conf/wp-config.php /var/www/html/wp-config.php

# # Copy the bash script
# COPY ./tools/wp-setup.sh /usr/local/bin/wp-setup.sh
# RUN chmod +x /usr/local/bin/wp-setup.sh

# # Set the entrypoint for the container
# ENTRYPOINT [ "/usr/local/bin/wp-setup.sh" ]

# # Start PHP-FPM
# CMD ["php-fpm7", "-F"]
