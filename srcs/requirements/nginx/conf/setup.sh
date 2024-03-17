#!/bin/bash

mkdir -p /var/www/aamhamdi/html/

mkdir -p ssl/
openssl genrsa -out /ngnix/ssl/test.key 2048;
openssl req -new -key /ngnix/ssl/test.key -out /ngnix/ssl/test.csr \
        -subj "/C=US/ST=New York/L=New York City/O=test/OU=IT/CN=127.0.0.1"
openssl x509 -req -days 365 -in /ngnix/ssl/test.csr \
        -signkey /ngnix/ssl/test.key -out /ngnix/ssl/test.crt

cat << del > /etc/nginx/sites-enabled/test.conf

server {
        listen 443 ssl;
        ssl_certificate         /ngnix/ssl/test.crt;       
        ssl_certificate_key     /ngnix/ssl/test.key;
        root /var/www/aamhamdi/html/;
        index index.php index.html;
        location / {
        }
        location ~ \.php$ {
                include snippets/fastcgi-php.conf;
                fastcgi_pass wordpress:9000;
        }
}
del

nginx -t
nginx -g 'daemon off;'
