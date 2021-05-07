FROM php:8.0.5-fpm
WORKDIR /app

RUN apt update
RUN apt-get install -y \
    bash \
    curl \
    zlib1g-dev \
    zip libzip-dev \
    libpng-dev

RUN pecl install grpc
RUN docker-php-ext-enable grpc

#composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer

RUN docker-php-ext-install zip exif gd
