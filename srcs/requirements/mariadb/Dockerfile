FROM alpine:3.14

# Install MariaDB and set the root password
RUN apk update && \ 
    apk add mariadb mariadb-client && \
	mkdir -p /run/mysqld && \
	chown -R mysql:mysql /run/mysqld && \
    mysql_install_db --user=mysql --datadir=/var/lib/mysql && \
	chown -R mysql:mysql /var/lib/mysql && \
    # /usr/bin/mysqld --user=mysql --bootstrap --verbose=0 < /docker-entrypoint-initdb.d/setup.sql
    sed -i 's/skip-networking/#skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf && \
    sed -i 's/#bind-address/bind-address/g' /etc/my.cnf.d/mariadb-server.cnf
    # sed -i 's/#character-set-server/character-set-server/g' /etc/my.cnf.d/mariadb-server.cnf && \
    # sed -i 's/#collation-server/collation-server/g' /etc/my.cnf.d/mariadb-server.cnf

# Copy the MariaDB configuration file
# COPY ./conf/my.cnf /etc/mysql/conf.d/my.cnf

# Copy the script that will run when the container starts up
COPY ./tools/script.sh /usr/local/bin

# Give the script the appropriate permissions
RUN chmod +x /usr/local/bin/script.sh

# Expose port
EXPOSE 3306

# Start MariaDB
CMD sh -c "mysqld --user=mysql --console"
# CMD ["/bin/sh", "-c", "/usr/local/bin/script.sh && mysqld --user=mysql --console"]



# # ------------------------------------------------------------------------------------------------------------------------

# FROM alpine:3.14

# # Install MariaDB
# RUN apk update && \
# 	apk add mariadb mariadb-client

# # Create a directory for MariaDB data
# RUN mkdir -p /var/lib/mysql/ && \
# 	mkdir -p /var/run/mysqld/ && \
# 	mkdir -p /run/mysqld/ && \
# 	# chown -R mysql:mysql /var/lib/mysql && \
# 	# chown -R mysql:mysql /var/run/mysqld && \
# 	# chown -R mysql:mysql /run/mysqld && \
# 	chmod 777 /var/run/mysqld && \
# 	chmod 777 /run/mysqld && \
# 	chmod 777 /var/lib/mysql

#     # chown mysql:mysql /var/lib/mysql && \
# 	# chmod 777 /var/lib/mysql

# # Copy the custom configuration file
# # COPY ./conf/my.cnf /etc/mysql/my.cnf

# # Set the entrypoint for the container
# # ENTRYPOINT ["mysqld"]

# # Start MariaDB
# CMD sh -c "mysqld --user=mysql --console "
