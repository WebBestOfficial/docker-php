
FROM php:7.4-apache
MAINTAINER Gdeon van der Merwe "gideon@webbest.co.za"
ENV REFRESHED_AT 2021-08-17

RUN apt-get update && apt-get install -y \
	libfreetype6-dev \
	libjpeg62-turbo-dev \
	libpng-dev \
	libzip-dev \ 
	mariadb-client

RUN docker-php-ext-install -j$(nproc) opcache mysqli pdo_mysql zip && \
    docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install -j$(nproc) gd

RUN a2enmod rewrite

RUN groupadd -g 1000 php && \
    useradd -r -u 1000 -g php php