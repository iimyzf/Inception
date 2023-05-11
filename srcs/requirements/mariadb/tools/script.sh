#!/bin/sh

echo "CREATE DATABASE $MARIA_NAME;" >> init.sql
echo "GRANT ALL PRIVILEGES ON $MARIA_NAME.* TO '$MARIA_USER'@'%' IDENTIFIED BY '$MARIA_PASSWORD';" >> init.sql
echo "FLUSH PRIVILEGES;" >> init.sql

mysqld --user=mysql --init-file=/tmp/init.sql