#!/bin/bash

timeout=10
while [ "$timeout" -ne 0 ];
do
	mysql -h mariadb -p"$SQL_PASS" -u "$SQL_USER" 2> /dev/null
    if [ $? -eq 0 ];then
	    break
    else
	    echo "waiting for mariadb to start..."
	    sleep 2
    fi
	((timeout--))
done

mkdir -p /run/php

if ! wp core is-installed --allow-root; then
	echo "start installing wordpress"
	wp config create --dbname=$SQL_DB --dbuser=$SQL_USER --dbpass=$SQL_PASS \
	--dbhost=mariadb --allow-root

	wp core install --url="www.aamhamdi42.fr" --title="inception" --admin_user="$WP_USER" \
	--admin_password="$WP_PASS" --admin_email="$WP_MAIL" --allow-root

	wp plugin install redis-cache --activate --allow-root
	wp config set WP_REDIS_HOST redis --allow-root
	wp plugin update --all --allow-root

	chown -R www-data:www-data /var/www/wordpress
	chmod -R +rw /var/www/wordpress
else
	echo "wordpress is already installed"
fi

wp redis enable --allow-root

/usr/sbin/php-fpm7.4 -F 

