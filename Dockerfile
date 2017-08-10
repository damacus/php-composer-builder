FROM php:7.1.8-alpine
LABEL org.label-schema.name "php-composer-builder"
LABEL org.label-schema.description "PHP Composer Container for CI Build Environments"
LABEL org.label-schema.maintainer "Dan Webb"
LABEL org.label-schema.vcs-url "https://github.com/damacus/php-composer-builder"
ARG date
LABEL org.label-schema.build-date=$date

RUN docker-php-ext-install mysqli pdo pdo_mysql
RUN apk add --no-cache php5-soap
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

WORKDIR /src
