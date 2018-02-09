FROM php:7.2-alpine

WORKDIR /opt
ARG user='root'
COPY install-composer.sh install-composer.sh

ENV BUILD_PACKAGES bash curl-dev build-base libffi-dev ca-certificates openssl git openssh
RUN apk add --no-cache $BUILD_PACKAGES  &&\
    update-ca-certificates              &&\
    addgroup -S composer                &&\
    adduser -S -g composer composer     &&\
    chmod +x install-composer.sh        &&\
    ./install-composer.sh

USER $user
WORKDIR /project

ARG PROJECT=unknown
ARG DATE=unknown
ARG DESCRIPTION=unknown
ARG URL=unknown
ARG COMMIT=unknown

LABEL "io.damacus.title"=$PROJECT            \
      "io.damacus.created"=$DATE             \
      "io.damacus.description"=$DESCRIPTION  \
      "io.damacus.url"=$URL                  \
      "io.damacus.revision"=$COMMIT
