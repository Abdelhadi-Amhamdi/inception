
FROM debian

WORKDIR /ftp


RUN apt -y update
RUN apt -y install vsftpd

COPY . .
RUN chmod u+x conf/setup.sh

CMD [ "./conf/setup.sh" ]