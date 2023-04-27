FROM alpine:3.14

# Install PHP and necessary extensions
RUN apk update && \
    apk add php7 php7-fpm php7-mysqli php7-zlib php7-curl php7-json php7-xml php7-phar php7-intl php7-dom php7-xmlreader php7-ctype php7-session php7-mbstring

# Copy PHP configuration file
COPY ./conf/php-fpm.conf /etc/php7/php-fpm.conf

# Copy WordPress files to the container
# COPY wordpress /var/www/html

# Create a non-root user to run the PHP-FPM process
# RUN adduser -D -u 1000 -g 'www' www && \
#     chown -R www:www /var/www/html && \
#     mkdir /run/php && \
#     chown -R www:www /run/php

# Start PHP-FPM
CMD ["php-fpm7", "-F"]
