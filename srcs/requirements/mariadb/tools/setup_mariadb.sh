#!/bin/bash

service mysql start
db_exist=$(echo "SHOW DATABASES" | mysql -u root | grep "wp_db" | wc -l)
if [ $db_exist = "0" ]
then
echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE" | mysql -u root
echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'" | mysql -u root
echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%'" | mysql -u root
mysql wp_db -u root < /tmp/wp_dump.sql
mysql -e "ALTER USER '$MYSQL_ROOT'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD'; FLUSH PRIVILEGES;"
fi
service mysql stop
exec mysqld
