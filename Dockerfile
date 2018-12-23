FROM node:10.5.0

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
MONGO="your_mongo_db" \
MONGO_COLLECTION="entries" \
API_SECRET="your_api_secret" \
ENABLE="bridge openaps pump iob basal careportal sage cage maker" \
BG_TARGET_TOP="10" \
BG_TARGET_BOTTOM="4" \
BASE_URL="your_base_url" \

CMD ["node", "server.js"]
