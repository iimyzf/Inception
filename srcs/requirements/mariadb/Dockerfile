FROM alpine:3.14

# Install MariaDB and set the root password
RUN apk update && \ 
    apk add mariadb mariadb-client
    # mysql_install_db --user=mysql && \
    # /usr/bin/mysqld --user=mysql --bootstrap --verbose=0 < /docker-entrypoint-initdb.d/setup.sql
    # sed -i 's/skip-networking/#skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf && \
    # sed -i 's/#bind-address/bind-address/g' /etc/my.cnf.d/mariadb-server.cnf && \
    # sed -i 's/#character-set-server/character-set-server/g' /etc/my.cnf.d/mariadb-server.cnf && \
    # sed -i 's/#collation-server/collation-server/g' /etc/my.cnf.d/mariadb-server.cnf

# Copy the MariaDB configuration file
COPY ./conf/my.cnf /etc/mysql/my.cnf

# Expose port
EXPOSE 3306

# Start MariaDB
CMD ["mysqld_safe"]
