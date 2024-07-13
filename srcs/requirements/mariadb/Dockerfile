
FROM debian:bullseye

WORKDIR /mariadb

RUN apt -y update;
RUN apt-get -y install mariadb-server --no-install-recommends

EXPOSE 3306

COPY . .

RUN chmod +x ./conf/setup.sh; \
sed -i 's/^# port =.*/port = 3306/' /etc/mysql/my.cnf; \
sed -i 's/^#user.*/user = mysql/' /etc/mysql/mariadb.conf.d/50-server.cnf; \
sed -i 's/^bind-address.*/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

CMD [ "./conf/setup.sh" ]