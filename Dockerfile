FROM node:8.9.1

MAINTAINER Nightscout Contributors

RUN apt-get update && \
  apt-get -y dist-upgrade

RUN mkdir -p /opt/app
ADD . /opt/app
WORKDIR /opt/app

RUN npm install && \
  npm run postinstall && \
  npm run env

EXPOSE 1337

ENV DISPLAY_UNITS="mmol" \
MONGO="" \
MONGO_COLLECTION="entries" \
API_SECRET="" \
ENABLE="bridge openaps pump iob basal careportal sage cage maker" \
BG_TARGET_TOP="" \
BG_TARGET_BOTTOM="" \
BASE_URL="" \

CMD ["node", "server.js"]
