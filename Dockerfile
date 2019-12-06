FROM node:8
RUN apt-get update && \
    apt-get -y install libfontconfig && \
    npm install -g bower gulp http-server
COPY dep/matchminer-ui/ /matchminer-ui
WORKDIR /matchminer-ui
RUN npm install && \
    bower install --config.interactive=false  --allow-root && \
    gulp --env production build
COPY build/UI/config.json properties/config.json
RUN gulp --env dev build
WORKDIR /matchminer-ui/dist
ENTRYPOINT http-server -g
