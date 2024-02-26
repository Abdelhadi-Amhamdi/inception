#!/bin/bash

service mariadb start

echo "CREATE DATABASE wordpress;" | mysql
echo "CREATE USER 'myuser'@'%' IDENTIFIED BY 'root'" | mysql;
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'myuser'@'%';" | mysql
echo "FLUSH PRIVILEGES;" | mysql

mysql -u root -e shutdown
mysqld --user=mysql --console
