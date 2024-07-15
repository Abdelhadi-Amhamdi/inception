

FROM debian:bullseye


WORKDIR /website


RUN apt -y update
RUN apt -y install npm --no-install-recommends

COPY package.json .
RUN npm install

COPY . .

CMD [ "npm","run","dev" ]