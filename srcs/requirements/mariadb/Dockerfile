

FROM debian

WORKDIR /mariadb

COPY . .

RUN apt -y update;apt -y install mariadb-server

EXPOSE 3306

RUN chmod +x ./conf/setup.sh


RUN sed -i 's/^# port =.*/port = 3306/' /etc/mysql/my.cnf
RUN sed -i 's/^#user.*/user = mysql/' /etc/mysql/mariadb.conf.d/50-server.cnf
RUN sed -i 's/^bind-address.*/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf


CMD [ "./conf/setup.sh" ]