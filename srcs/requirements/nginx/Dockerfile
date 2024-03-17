

FROM debian

WORKDIR /ngnix

COPY . .

RUN apt -y update;apt -y install nginx openssl;

EXPOSE 443

RUN chmod +x ./conf/setup.sh

CMD ["./conf/setup.sh"]