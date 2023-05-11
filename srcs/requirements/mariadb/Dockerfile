FROM alpine:3.14

# Install MariaDB and set the root password
RUN apk update && \ 
    apk add mariadb mariadb-client  && \
	mkdir -p /run/mysqld && \
	chown -R mysql:mysql /run/mysqld && \
    mysql_install_db --user=mysql --datadir=/var/lib/mysql && \
	chown -R mysql:mysql /var/lib/mysql && \
	sed -i 's/skip-networking/#skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf && \
    sed -i 's/#bind-address/bind-address/g' /etc/my.cnf.d/mariadb-server.cnf

# Copy the script that will run when the container starts up
COPY ./tools/script.sh /tmp/script.sh

# Give the script the appropriate permissions
RUN chmod +x /tmp/script.sh

WORKDIR /tmp

CMD ./script.sh