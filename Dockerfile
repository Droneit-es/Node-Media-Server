FROM node:lts-alpine

ARG BUILD_DATE
ARG VCS_REF

LABEL org.label-schema.build-date="${BUILD_DATE}" \
      org.label-schema.name="node-media-server" \
      org.label-schema.description="A Node.js implementation of RTMP Server" \
      org.label-schema.usage="https://github.com/illuspas/Node-Media-Server#readme" \
      org.label-schema.vcs-ref="${VCS_REF}" \
      org.label-schema.vcs-url="https://github.com/illuspas/Node-Media-Server" \
      org.label-schema.vendor="Droneit-es" \
      org.label-schema.version="2.3.3" \
      maintainer="https://github.com/rubengargar"

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm i
RUN apk update
RUN apk add ffmpeg

COPY . .

EXPOSE 1935 8000 8443

CMD ["node","bin/app.js"]
