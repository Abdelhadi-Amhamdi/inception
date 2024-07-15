#!/bin/bash

mkdir -p /var/www/wordpress/

mkdir -p ssl/
openssl genrsa -out /ngnix/ssl/test.key 2048;
openssl req -new -key /ngnix/ssl/test.key -out /ngnix/ssl/test.csr \
        -subj "/C=US/ST=New York/L=New York City/O=test/OU=IT/CN=127.0.0.1"
openssl x509 -req -days 365 -in /ngnix/ssl/test.csr \
        -signkey /ngnix/ssl/test.key -out /ngnix/ssl/test.crt

cat << del > /etc/nginx/sites-enabled/wordpress.conf
server {

        include mime.types;
        listen 443 ssl;
        server_name aamhamdi42.fr www.aamhamdi42.fr;

        ssl_protocols TLSv1.3;
        ssl_certificate         /ngnix/ssl/test.crt;
        ssl_certificate_key     /ngnix/ssl/test.key;

        root /var/www/wordpress;
        index index.php index.html;

        location ~ \.php$ {
                include snippets/fastcgi-php.conf;
                fastcgi_pass wordpress:9000;
        }
}
del

cat << del > /etc/nginx/sites-enabled/website.conf
server {
        include mime.types;
        listen 8082 ssl;
        ssl_certificate         /ngnix/ssl/test.crt;
        ssl_certificate_key     /ngnix/ssl/test.key;
        location / {
                proxy_pass http://website:3000;
        }
}
del


cat << del > /etc/nginx/sites-enabled/adminer.conf
server {
        include mime.types;
        listen 8081 ssl;
        ssl_certificate         /ngnix/ssl/test.crt;       
        ssl_certificate_key     /ngnix/ssl/test.key;

        root /var/www/adminer;
        index index.php index.html;

        location ~ \.php$ {
                include snippets/fastcgi-php.conf;
                fastcgi_pass adminer:9100;
        }
}
del

nginx -g 'daemon off;'
