

FROM debian

WORKDIR /ngnix

RUN apt -y update;apt -y install nginx openssl;

COPY . .

EXPOSE 443

RUN chmod +x ./conf/setup.sh

CMD ["./conf/setup.sh"]