FROM alpine:3.16

ARG DB_NAME \
    DB_USER \
    DB_PASS

RUN apk update && apk upgrade && apk add --no-cache \
    php8 \
    php8-fpm \
    php8-mysqli \
    php8-json \
    php8-curl \
    php8-dom \
    php8-exif \
    php8-fileinfo \
    php8-mbstring \
    php8-openssl \
    php8-xml \
    php8-zip \
    php8-phar \
    wget \
    curl \
    mysql-client


COPY requirements/wordpress/tools/start.sh /usr/local/bin/
COPY requirements/wordpress/conf/www.conf /etc/php8/php-fpm.d/www.conf

RUN chmod +x /usr/local/bin/start.sh

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar &&\
    chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

ENTRYPOINT ["/usr/local/bin/start.sh"]

WORKDIR /var/www/html

EXPOSE 9000


CMD [ "/usr/sbin/php-fpm8", "-F" ]
