#!/bin/bash

service mariadb start

echo "CREATE DATABASE wordpress;" | mysql
echo "CREATE USER 'myuser'@'%' IDENTIFIED BY 'root'" | mysql;
echo "GRANT ALL PRIVILEGES ON *.* TO 'myuser'@'%';" | mysql
echo "FLUSH PRIVILEGES;" | mysql

mysqladmin -u myuser -p shutdown -p'root'
mysqld --user=mysql --console
