FROM alpine:3.14

RUN apk update && \
	apk add curl php7 php7-session php7-pdo php7-pdo_mysql php7-pdo_pgsql php7-pdo_sqlite php7-mysqli php7-pgsql php7-sqlite3 php7-json php7-ctype php7-openssl php7-tokenizer php7-mbstring php7-gd php7-fileinfo php7-xml php7-fpm

RUN mkdir -p /var/www/html/adminer && \
	sed -i "s/.*listen = 127.0.0.1:8000/listen = 0.0.0.0:8000/g" /etc/php7/php-fpm.d/www.conf

WORKDIR /var/www/html/adminer

RUN curl -s -L https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-mysql-en.php --output /var/www/html/adminer/index.php

CMD ["php-fpm7", "--nodaemonize"]
