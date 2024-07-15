#!/bin/bash

service mariadb start
sleep 5
echo "CREATE DATABASE IF NOT EXISTS $SQL_DB;" | mysql
echo "CREATE USER IF NOT EXISTS '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASS';" | mysql;
echo "GRANT ALL PRIVILEGES ON *.* TO '$SQL_USER'@'%';" | mysql
echo "FLUSH PRIVILEGES;" | mysql

mysqladmin -u root -p shutdown -p"$SQL_PASS"
mysqld --user=mysql --console
