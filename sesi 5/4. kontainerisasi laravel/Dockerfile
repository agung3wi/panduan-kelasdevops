FROM php:7.4-apache

ADD https://raw.githubusercontent.com/mlocati/docker-php-extension-installer/master/install-php-extensions /usr/local/bin/

RUN chmod uga+x /usr/local/bin/install-php-extensions && sync \
    && install-php-extensions bz2 \
    gettext \
    intl \
    exif \
    pdo_mysql \
    bcmath

COPY default.conf /etc/apache2/sites-enabled/000-default.conf
RUN a2enmod rewrite

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    libicu-dev \
    zip \
    unzip \
    && rm -rf /var/lib/apt/lists/*

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

COPY . /app
COPY .env.example /app/.env
WORKDIR /app
RUN chown www-data:www-data -R /app
RUN composer install
RUN chmod 0777 -R /app/storage
