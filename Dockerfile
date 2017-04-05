FROM php:fpm-alpine
MAINTAINER Vojtech Bartos <barvoj@seznam.cz>

# Install modules
RUN apk update && apk upgrade \
    && apk add zlib-dev \
    && docker-php-ext-install bcmath mbstring calendar zip

RUN rm /usr/local/etc/php-fpm.d/www.conf
COPY www.conf /usr/local/etc/php-fpm.d

WORKDIR /var/www

VOLUME /var/www/www

CMD ["php-fpm"]
