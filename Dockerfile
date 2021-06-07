FROM php:7.4.19-fpm

MAINTAINER Amondar-SO

##### INSTALL NEEDED PACKAGES
RUN apt update \
    && apt install -y  coreutils nano curl libonig-dev libpng-dev libjpeg-dev zlib1g-dev libfreetype6-dev libmcrypt-dev \
       libxml2-dev libzip-dev wget unzip supervisor git icu-devtools libmagickwand-dev libpq-dev freetds-dev freetds-bin \
       freetds-common \
    && ln -s /usr/lib/x86_64-linux-gnu/libsybdb.a /usr/lib/ \
    && docker-php-ext-configure gd --with-jpeg --with-freetype \
    && docker-php-ext-configure intl \
    && docker-php-ext-install -j$(nproc) json mbstring zip pdo pdo_mysql mysqli pdo_pgsql pdo_dblib iconv gd exif xml opcache intl bcmath \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer


EXPOSE 80 9000