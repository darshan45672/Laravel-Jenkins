FROM php:8.2.0-apache
WORKDIR /var/www/html

# Mod Rewrite
RUN a2enmod rewrite

# Linux Libraries
RUN apt-get update -y && apt-get install -y \
    libicu-dev \
    libmariadb-dev \
    unzip zip \
    zlib1g-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev 

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

#  PHP Extensions
RUN docker-php-ext-install gettext intl pdo_mysql mysqli gd

RUN docker-php-ext-configure gd --enable-gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd