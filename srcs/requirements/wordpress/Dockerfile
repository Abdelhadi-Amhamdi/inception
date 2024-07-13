
FROM debian:bullseye

WORKDIR /wordpress

RUN apt-get install software-properties-common; add-apt-repository ppa:ondrej/php; apt-get -y update
RUN apt-get -y install curl php php-mysql php8.3-fpm mariadb-client redis ca-certificates --no-install-recommends

RUN sed -i 's/^listen =.*/listen = 9000/' /etc/php/8.2/fpm/pool.d/www.conf; \
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar; \
chmod +x wp-cli.phar; mv wp-cli.phar /usr/local/bin/wp; wp core download --allow-root

COPY . .

RUN chmod +x ./conf/setup.sh

CMD [ "./conf/setup.sh" ] 
