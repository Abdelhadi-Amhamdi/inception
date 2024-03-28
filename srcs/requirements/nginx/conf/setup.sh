#!/bin/bash

mkdir -p /var/www/wordpress/html/

mkdir -p ssl/
openssl genrsa -out /ngnix/ssl/test.key 2048;
openssl req -new -key /ngnix/ssl/test.key -out /ngnix/ssl/test.csr \
        -subj "/C=US/ST=New York/L=New York City/O=test/OU=IT/CN=127.0.0.1"
openssl x509 -req -days 365 -in /ngnix/ssl/test.csr \
        -signkey /ngnix/ssl/test.key -out /ngnix/ssl/test.crt

cat << del > /etc/nginx/sites-enabled/wordpress.conf
server {
        listen 443 ssl;
        ssl_certificate         /ngnix/ssl/test.crt;       
        ssl_certificate_key     /ngnix/ssl/test.key;
        root /var/www/wordpress/html/;
        index index.php index.html;
        location ~ \.php$ {
                include snippets/fastcgi-php.conf;
                fastcgi_pass wordpress:9000;
        }
}
del

cat << del > /etc/nginx/sites-enabled/website.conf
server {
        listen 8080;
     
        location / {
                proxy_pass http://website:3000;
        }
}
del


cat << del > /etc/nginx/sites-enabled/adminer.conf
server {
    listen 8081;

    location / {
        proxy_pass http://adminer:80;
    }
}
del

nginx -t
nginx -g 'daemon off;'
