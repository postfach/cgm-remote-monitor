FROM node:8.5.0

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
ENV DISPLAY_UNITS mmol
ENV mongo
ENV mongo_collection entries
ENV API_SECRET
ENV ENABLE bridge openaps pump iob basal careportal sage cage maker
ENV BG_TARGET_TOP
ENV BG_TARGET_BOTTOM

CMD ["node", "server.js"]
