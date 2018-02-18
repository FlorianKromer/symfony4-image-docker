FROM php:7.1.3

RUN \
  apt-get update &&\
  apt-get install -y unzip git zlib1g-dev libicu-dev g++ &&\
  docker-php-ext-install pdo pdo_mysql intl &&\
  docker-php-ext-configure intl &&\
  curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
