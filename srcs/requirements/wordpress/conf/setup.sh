#!/bin/bash

sleep 10
wp config create --dbname=wordpress --dbuser=myuser --dbpass=root --dbhost=mariadb --allow-root
# wp core install --url="localhost/test" --title="test" --admin_user="myuser" --admin_password="root" --admin_email="example@gmail.com" --allow-root
mkdir -p /var/www/aamhamdi/html
cp -r * /var/www/aamhamdi/html

php-fpm8.2 -F -O

