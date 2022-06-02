FROM php:8.1.5RC1-fpm

# Install system dependencies
RUN apt-get update && apt-get install -y git libicu-dev libzip-dev curl mc libpng-dev \
    libwebp-dev libjpeg62-turbo-dev libpng-dev libxpm-dev libfreetype6-dev zip unzip

RUN docker-php-ext-configure intl
RUN docker-php-ext-configure gd --with-freetype --with-jpeg

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql intl zip gd

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /srv
