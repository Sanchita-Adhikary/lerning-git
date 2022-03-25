FROM mynginxapp
LABEL maintainer="salagars"
RUN apk add --update nodejs nodejs-npm
COPY . /src
WORKDIR /src
RUN npm install
EXPOSE 8090
ENTRYPOINT ["node", "./app.js"]
