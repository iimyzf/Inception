#!/bin/sh

# Create the database and grant privileges to the user
mysql -u root -p -e "CREATE DATABASE $MARIA_NAME;"
mysql -u root -p -e "GRANT ALL PRIVILEGES ON $MARIA_NAME.* TO '$MARIA_USER'@'%' IDENTIFIED BY '$MARIA_PASSWORD';"
mysql -u root -p -e "FLUSH PRIVILEGES;"

sleep 20000
# If not set up yet
# if [ $? -ne 0 ]; then

# 	# sed -i 's/skip-networking/#skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf
#     # sed -i 's/#bind-address/bind-address/g' /etc/my.cnf.d/mariadb-server.cnf

# 	# if ! mysqladmin --wait=30 ping; then
#     #   printf "MariaDB Daemon Unreachable\n"
#     #   exit 1
#   	# fi

# 	mysql -u root --password=password -e "CREATE DATABASE ${MARIA_NAME};"
# 	mysql -u root --password=password -e "GRANT ALL PRIVILEGES ON ${MARIA_NAME}.* TO '${MARIA_USER}'@'%' IDENTIFIED BY '${MARIA_PASSWORD}';"
# 	mysql -u root --password=password -e "FLUSH PRIVILEGES;"

# 	# sleep 20000

# 	# eval "echo \"$(cat /tmp/query.sql)\"" | mariadb
#     # pkill mariadb
# fi