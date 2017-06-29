FROM hypriot/rpi-node:7.6.0

ADD package.json /tmp/package.json
RUN cd /tmp && npm install

RUN mkdir -p /usr/src/app && cp -a /tmp/node_modules /usr/src/app

COPY package.json /usr/src/app/
COPY . /usr/src/app

WORKDIR /usr/src/app

CMD [ "npm", "start" ]

expose 3000