
FROM debian

WORKDIR /wordpress

COPY . .

RUN apt -y update; apt -y install curl php php-mysql php-fpm mariadb-client iputils-ping

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN sed -i 's/^listen =.*/listen = 9000/' /etc/php/8.2/fpm/pool.d/www.conf
RUN chmod +x ./conf/setup.sh
RUN wp core download --allow-root

CMD [ "./conf/setup.sh" ]
