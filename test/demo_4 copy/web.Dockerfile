FROM ubuntu:20.04

RUN apt update -y && apt install -y software-properties-common

RUN add-apt-repository ppa:ondrej/php -y

RUN apt-get update -y && apt-get install nginx php8.1-fpm -y

RUN apt-get update -y && apt-get install php8.1-mongodb php8.1-curl php8.1-dom -y

RUN apt-get update -y && apt-get install curl git zip unzip -y

RUN curl https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/app

COPY ./services/laravel-api/composer.* /var/app/laravel-api/

RUN cd /var/app/laravel-api/ && composer install --ignore-platform-reqs --no-autoloader --no-suggest --no-scripts

COPY ./configurations/nginx/ /etc/nginx/sites-enabled/

COPY ./services/ ./

RUN cd /var/app/laravel-api/ && chown -R www-data:www-data storage

RUN cd /var/app/laravel-api/ && composer dump-autoload

CMD /etc/init.d/php8.1-fpm start && nginx -g "daemon off;"

EXPOSE 8000