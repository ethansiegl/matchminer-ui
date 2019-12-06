FROM node:8
RUN apt-get update && \
    apt-get -y install libfontconfig && \
    npm install -g bower gulp http-server

COPY . /

WORKDIR /
RUN bower install --config.interactive=false  --allow-root && npm install
#COPY ./properties/config.json properties/config.json
RUN gulp --env dev build
WORKDIR /dist
ENTRYPOINT http-server -g
