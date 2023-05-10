-- Delete Already Existing Root User on the Host
DELETE FROM
  mysql.user
WHERE
  User = '$MARIA_USER';
--   AND Host NOT IN ('$HOST_NAME', '$HOST_IPV4', '$HOST_IPV6');

-- Set Password of Root User on MariaDB
SET
  PASSWORD FOR '$MARIA_USER'@'$%' = PASSWORD('$MARIA_PASSWORD');

-- Create WordPress Database
CREATE DATABASE IF NOT EXISTS $MARIA_NAME;

-- Create Another User for WordPress
-- CREATE USER '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PWD';

-- Grant Permissions
GRANT ALL PRIVILEGES ON $MARIA_NAME.* TO '$MARIADB_USER'@'%' WITH GRANT OPTION;

-- Apply
FLUSH PRIVILEGES;