FROM debian:bullseye

WORKDIR /cadvisor

RUN apt update -y

RUN apt install curl -y

RUN curl -Lo cadvisor  https://github.com/google/cadvisor/releases/download/v0.49.1/cadvisor-v0.49.1-linux-amd64

RUN chmod +x cadvisor


EXPOSE 8080

CMD [ "./cadvisor" ]