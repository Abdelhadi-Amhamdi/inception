

FROM debian

WORKDIR /mariadb

COPY . .

RUN apt -y update;\
    apt -y upgrade;\
    apt -y install mariadb-server

EXPOSE 3306

RUN chmod +x ./conf/setup.sh

# ENV MYSQL_DATABASE=test
# ENV MYSQL_USER=user1
# ENV MYSQL_PASSWORD=root

RUN sed -i 's/^socket =.*/port = 3306/' /etc/mysql/my.cnf

CMD [ "./conf/setup.sh" ]