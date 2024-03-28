

FROM debian


WORKDIR /website


RUN apt -y update
RUN apt -y install nodejs npm

COPY package.json .
RUN npm install

COPY . .

CMD [ "npm","run","dev" ]