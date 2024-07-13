

FROM debian:bullseye

WORKDIR /ngnix

RUN apt -y update;
RUN apt-get -y install nginx openssl --no-install-recommends

COPY . .

EXPOSE 443

RUN chmod +x ./conf/setup.sh

CMD ["./conf/setup.sh"]