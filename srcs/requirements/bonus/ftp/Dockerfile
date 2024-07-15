
FROM debian:bullseye

WORKDIR /ftp


RUN apt -y update
RUN apt -y install vsftpd --no-install-recommends

COPY . .
RUN chmod u+x conf/setup.sh

CMD [ "./conf/setup.sh" ]