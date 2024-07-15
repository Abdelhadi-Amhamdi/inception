
FROM debian:bullseye

WORKDIR /redis

RUN apt -y update
RUN apt -y install redis-server php-redis --no-install-recommends

RUN sed -i 's/^bind *./#bind 127.0.0.1/' /etc/redis/redis.conf


CMD [ "redis-server", "--protected-mode", "no" ]