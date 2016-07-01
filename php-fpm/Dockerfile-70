FROM php:7.0-fpm

MAINTAINER Larry Eitel <larry@eitel.com>

ADD ./laravel.ini /usr/local/etc/php/conf.d
ADD ./xdebug.ini /usr/local/etc/php/conf.d
ADD ./laravel.pool.conf /usr/local/etc/php-fpm.d/

RUN apt-get update && apt-get install -y \
    libpq-dev \
    curl \
    libpng12-dev \
    libfreetype6-dev \
    libssl-dev \
    libmcrypt-dev \
    php-pear \
    ssh \
    telnet \
    git \
    curl \
    less \
    vim \
    nano \
    --no-install-recommends \
    && rm -r /var/lib/apt/lists/*


# install mcrypt library
RUN docker-php-ext-install mcrypt

# configure gd library
RUN docker-php-ext-configure gd \
    --enable-gd-native-ttf \
    --with-freetype-dir=/usr/include/freetype2

# Install extensions using the helper script provided by the base image
RUN docker-php-ext-install \
    pdo_mysql \
    gd

# Install Memcached for php 7
# RUN curl -L -o /tmp/memcached.tar.gz "https://github.com/php-memcached-dev/php-memcached/archive/php7.tar.gz" \
#     && mkdir -p /usr/src/php/ext/memcached \
#     && tar -C /usr/src/php/ext/memcached -zxvf /tmp/memcached.tar.gz --strip 1 \
#     && docker-php-ext-configure memcached \
#     && docker-php-ext-install memcached \
#     && rm /tmp/memcached.tar.gz

RUN cd /usr/share \
    && git clone https://github.com/pear/pear-core.git pear
    
# Install xdebug
RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

# Add bin folder of composer to PATH.
# RUN echo "export PATH=${PATH}:/var/www/laravel/vendor/bin" >> ~/.bashrc

# Install Composer
# RUN curl -s http://getcomposer.org/installer | php \
#   && mv composer.phar /usr/local/bin/composer

# Load xdebug Zend extension with phpunit command
# RUN echo "alias phpunit='php -dzend_extension=xdebug.so /var/www/laravel/vendor/bin/phpunit'" >> ~/.bashrc


RUN cp /usr/src/php/php.ini-development /usr/local/etc/php/php.ini
RUN cp /usr/src/php/php.ini-development /usr/src/php/php.ini

RUN rm -f /etc/service/sshd/down

## Created keys for vm use
RUN mkdir -p /root/.ssh

# These are excluded in .gitignore
ADD ./id_rsa_vm /root/.ssh
ADD ./id_rsa_vm.pub /root/.ssh

RUN ls /root/.ssh
RUN touch /root/.ssh/authorized_keys
RUN cat /root/.ssh/id_rsa_vm.pub >> /root/.ssh/authorized_keys

RUN usermod -u 1000 www-data

WORKDIR /var/www/laravel

CMD ["php-fpm"]

EXPOSE 9000
