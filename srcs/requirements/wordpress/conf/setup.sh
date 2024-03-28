#!/bin/bash

while [ 1 ];
do
	mysql -h mariadb -p"$SQL_PASS" -u "$SQL_USER" > /dev/null
    if [ $? -eq 0 ];then
	    break
    else
	    echo "waiting for mariadb"
	    sleep 1
    fi
done

mkdir -p /var/www/wordpress/html/
wp config create --dbname=$SQL_DB --dbuser=$SQL_USER --dbpass=$SQL_PASS --dbhost=mariadb --allow-root
wp core install --url="https://aamhamdi42.fr" --title="inception" --admin_user="$WP_USER" --admin_password="$WP_PASS" --admin_email="$WP_MAIL" --allow-root
 

chown -R www-data:www-data /var/www/wordpress/html
chmod -R u+rw /var/www/wordpress/html 
wp plugin install redis-cache --activate --allow-root
wp config set WP_REDIS_HOST redis --allow-root



wp plugin update --all --allow-root


cp -r  * /var/www/wordpress/html/

wp redis enable --allow-root
# wp redis flushall --allow-root

php-fpm8.2 -F -O

