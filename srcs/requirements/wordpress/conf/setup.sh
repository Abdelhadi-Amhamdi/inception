#!/bin/bash

mkdir -p /var/www/aamhamdi/html

cp -r * /var/www/aamhamdi/html

php-fpm8.2 -F -O

