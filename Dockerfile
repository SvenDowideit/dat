# copied from https://github.com/datproject/datBase/blob/master/Dockerfile
FROM node:6.9
EXPOSE 80

ENV PORT 80
ENV NODE_ENV development

ENV DATADIR /data
VOLUME /data

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY package.json /usr/src/app/
RUN npm install --production --loglevel warn 
COPY . /usr/src/app
RUN npm link
COPY compose-sync.sh /
ENTRYPOINT ["dat"]
#RUN npm run build-js-prod && npm run build-css && npm run minify && npm run version

# do docker exec: npm run database

#CMD npm run database && DEBUG=dat-registry npm run server
