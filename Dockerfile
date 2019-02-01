FROM php:7.1.26-apache-jessie

RUN \
  apt-get update &&\
  apt-get install -y unzip git zlib1g-dev libicu-dev g++ nano  &&\
  docker-php-ext-install pdo pdo_mysql intl opcache bcmath zip &&\
  docker-php-ext-configure intl &&\
  curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
