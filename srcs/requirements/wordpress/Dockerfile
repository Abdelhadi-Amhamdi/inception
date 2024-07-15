
FROM debian:bullseye


RUN apt-get -y update
RUN apt-get -y install curl php php-mysql php-fpm mariadb-client redis ca-certificates --no-install-recommends

WORKDIR /var/www/wordpress

RUN sed -i 's/^listen =.*/listen = 9000/' /etc/php/7.4/fpm/pool.d/www.conf; \
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar; \
chmod +x wp-cli.phar; mv wp-cli.phar /usr/local/bin/wp; wp core download --allow-root

COPY . /nginx

RUN chmod +x /nginx/conf/setup.sh

CMD [ "/nginx/conf/setup.sh" ] 
