# pull base node image.
FROM node:8

# add the npm dependencies and install
COPY ["package.json", "bower.json", "package-lock.json", "/"]
WORKDIR /
COPY phantomjs-2.1.1-linux-x86_64.tar.bz2 /usr/local/share/phantomjs-2.1.1-linux-x86_64.tar.bz2
RUN cd /usr/local/share && \
    tar xjf phantomjs-2.1.1-linux-x86_64.tar.bz2 && \
    ln -s /usr/local/share/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/share/phantomjs && \
    ln -s /usr/local/share/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin/phantomjs && \
    ln -s /usr/local/share/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/bin/phantomjs
RUN npm install

# install bower and gulp globally
RUN npm install -g gulp-cli bower
RUN bower install --config.interactive=false  --allow-root

# add files to context
COPY app /app
COPY gulp /gulp
COPY certificates /certificates
COPY gulpfile.js /gulpfile.js
COPY properties /properties

RUN gulp build --env=dev
