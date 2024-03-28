FROM debian

RUN apt update
RUN apt install php curl php-mysql -y
RUN curl -L https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php > /var/www/html/index.php
RUN rm -f /var/www/html/index.html
RUN echo "ServerName aamhamdi42.fr" >> /etc/apache2/apache2.conf
RUN sed -i 's/^Listen 80/Listen 80/' /etc/apache2/ports.conf 

EXPOSE 80

CMD ["apache2ctl", "-D", "FOREGROUND"]