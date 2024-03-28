
FROM debian

WORKDIR /wordpress


RUN apt -y update; apt -y install curl php php-mysql php-fpm mariadb-client iputils-ping redis

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN sed -i 's/^listen =.*/listen = 9000/' /etc/php/8.2/fpm/pool.d/www.conf
RUN wp core download --allow-root

COPY . .

RUN chmod +x ./conf/setup.sh

CMD [ "./conf/setup.sh" ] 
