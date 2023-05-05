#!/bin/bash

# Set the database name and user credentials
DB_NAME="mywordpress"
DB_USER="wordpress"
DB_PASS="password"

# Create the database and grant privileges to the user
mysql -u root -p -e "CREATE DATABASE $DB_NAME;"
mysql -u root -p -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASS';"