FROM hypriot/rpi-node:7.6.0

ONBUILD ADD package.json /tmp/package.json
ONBUILD RUN cd /tmp && npm install

ONBUILD RUN mkdir -p /usr/src/app && cp -a /tmp/node_modules /usr/src/app
ONBUILD WORKDIR /usr/src/app

ONBUILD COPY package.json /usr/src/app/
ONBUILD COPY . /usr/src/app

CMD [ "npm", "start" ]

expose 3000