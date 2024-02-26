

FROM debian

WORKDIR /ngnix

COPY . .

RUN apt -y update;\
    apt -y upgrade;\
    apt -y install nginx openssl ;

EXPOSE 8081

RUN chmod +x ./conf/setup.sh

CMD ["./conf/setup.sh"]