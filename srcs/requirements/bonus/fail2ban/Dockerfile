FROM debian

WORKDIR /fail2ban

COPY . .

RUN apt -y update
RUN apt -y install fail2ban


RUN chmod u+x ./conf/setup.sh

CMD [ "./conf/setup.sh" ]