#!/bin/bash

service mysql start
db_exist=$(echo "SHOW DATABASES" | mysql -u root | grep "wp_db" | wc -l)
echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE" | mysql -u root
echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'" | mysql -u root
echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%'" | mysql -u root
#
# if 조건 삽입
#
service mysql stop
exec mysqld
