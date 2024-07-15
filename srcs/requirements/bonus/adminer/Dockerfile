FROM debian:bullseye 

RUN apt update
RUN apt install curl -y
RUN apt install php php-fpm php-mysql -y --no-install-recommends

RUN mkdir -p /var/www/adminer; mkdir -p /run/php; \
sed -i 's/^listen =.*/listen = 9100/' /etc/php/7.4/fpm/pool.d/www.conf;

RUN curl -L https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php > /var/www/adminer/index.php; \
rm -f /var/www/html

EXPOSE 9100

CMD ["/usr/sbin/php-fpm7.4", "-F"]