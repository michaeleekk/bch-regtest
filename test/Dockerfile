FROM node:13

WORKDIR /src

COPY package.json package-lock.json /src/

RUN npm install

COPY tests /src/tests

CMD npm test
