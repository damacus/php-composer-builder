FROM php:7.1.8-alpine
ARG PROJECT
ARG DESCRIPTION
ARG MAINTAINER
ARG URL
ARG DATE
ARG COMMIT
LABEL "org.label-schema.name"=$PROJECT
LABEL "org.label-schema.build-date"=$DATE
LABEL "org.label-schema.maintainer"=$MAINTAINER
LABEL "org.label-schema.description"=$DESCRIPTION
LABEL "org.label-schema.vcs-url"=$URL
LABEL "org.label-schema.commit-sha"=$COMMIT

WORKDIR /opt
COPY install-composer.sh install-composer.sh
RUN apk add --no-cache ca-certificates openssl &&\
    update-ca-certificates                     &&\
    chmod +x install-composer.sh               &&\
    ./install-composer.sh
RUN apk add --no-cache git


WORKDIR /src
