#!/bin/bash

mkdir -p ssl/

openssl req -x509 -nodes -out /nginx/ssl/inc.crt -keyout \
        /nginx/ssl/inc.key -subj "/C=MO/ST=KH/L=KH/O=42/OU=IT/CN=$HOST_NAME"

cat << del > /etc/nginx/sites-enabled/wordpress.conf
server {

        include mime.types;
        listen 443 ssl;

        ssl_protocols           TLSv1.3;
        ssl_certificate         /nginx/ssl/inc.crt;
        ssl_certificate_key     /nginx/ssl/inc.key;

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

         ssl_protocols          TLSv1.3;
        ssl_certificate         /nginx/ssl/inc.crt;
        ssl_certificate_key     /nginx/ssl/inc.key;
        
        location / {
                proxy_pass http://website:3000;
        }
}
del


cat << del > /etc/nginx/sites-enabled/adminer.conf
server {
        include mime.types;
        listen 8081 ssl;

         ssl_protocols          TLSv1.3;
        ssl_certificate         /nginx/ssl/inc.crt;
        ssl_certificate_key     /nginx/ssl/inc.key;

        root /var/www/adminer;
        index index.php index.html;

        location ~ \.php$ {
                include snippets/fastcgi-php.conf;
                fastcgi_pass adminer:9100;
        }
}
del

nginx -g 'daemon off;'
