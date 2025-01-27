FROM node:12.16-alpine

COPY . /app

WORKDIR /app

RUN apk upgrade --update \
    && apk add bash git ca-certificates \
    && npm install -g bower \
    && npm --unsafe-perm --production install \
    && apk del git \
    && rm -rf /var/cache/apk/* \
        /app/.git \
        /app/screenshots \
        /app/test \
    && mkdir /app/kongadata /app/.tmp

EXPOSE 1337

VOLUME /app/kongadata

ENTRYPOINT ["/app/start.sh"]
