FROM php:7.3-apache


# update and upgrade
RUN apt-get update && apt-get upgrade -y
# dependencies
RUN apt-get install -y git cron g++ gettext libicu-dev openssl libc-client-dev libkrb5-dev libxml2-dev libfreetype6-dev libgd-dev libmcrypt-dev bzip2 zip libzip-dev libbz2-dev libtidy-dev libcurl4-openssl-dev libz-dev libmemcached-dev libxslt-dev libicu-dev libmagickwand-dev
RUN apt-get install -yqq imagemagick mc


## php modules
RUN docker-php-ext-configure gd --with-freetype-dir=/usr --with-jpeg-dir=/usr
RUN docker-php-ext-install gd
RUN docker-php-ext-install mysqli
RUN docker-php-ext-configure calendar && docker-php-ext-install calendar
RUN docker-php-ext-configure intl && docker-php-ext-install intl
RUN docker-php-ext-configure zip --with-libzip && docker-php-ext-install zip
RUN pecl install imagick && docker-php-ext-enable imagick
RUN pecl install memcached && docker-php-ext-enable memcached
RUN docker-php-ext-install bcmath
RUN docker-php-ext-install pdo pdo_mysql
RUN docker-php-ext-install opcache
RUN docker-php-ext-install soap


ADD ./php.ini /usr/local/etc/php/conf.d/app.ini
ADD ./opcache.ini /usr/local/etc/php/conf.d/opcache.ini


## apache modules
RUN a2enmod rewrite


## nodeJs
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs


## composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php --install-dir=/bin --filename=composer
RUN php -r "unlink('composer-setup.php');"


# Install xdebug
RUN pecl install xdebug-2.7.0
RUN docker-php-ext-enable xdebug
RUN echo 'xdebug.remote_port=9000' >> /usr/local/etc/php/php.ini
RUN echo 'xdebug.remote_enable=on' >> /usr/local/etc/php/php.ini
RUN echo 'xdebug.remote_connect_back=on' >> /usr/local/etc/php/php.ini
RUN echo 'xdebug.show_error_trace=on' >> /usr/local/etc/php/php.ini
RUN echo 'show_exception_trace=on' >> /usr/local/etc/php/php.ini
ARG XDEBUG_INI=/usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo "xdebug.default_enable = on" >> ${XDEBUG_INI} \
    && echo "xdebug.remote_enable = on" >> ${XDEBUG_INI} \
    && echo "xdebug.remote_autostart = on" >> ${XDEBUG_INI} \
    && echo "xdebug.remote_connect_back = on" >> ${XDEBUG_INI} \
    && echo "xdebug.remote_port = 9000" >> ${XDEBUG_INI}


RUN usermod -u 1000 www-data
RUN chown 1000:1000 /var/www -R


EXPOSE 80
CMD /usr/sbin/apache2ctl -D FOREGROUND
