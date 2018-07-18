FROM php:7.2-fpm

ARG username
ARG useruid

ENV DEBIAN_FRONTEND="noninteractive" \
    TERM=xterm \
    TZ=Europe/Moscow \
    PHP_IDE_CONFIG="serverName=$username" \
    USERNAME=$username

ENV PHP_EXTRA_CONFIGURE_ARGS --enable-fpm --with-fpm-user=$useruid --with-fpm-group=$useruid

### install dependences
RUN apt-get update && apt-get install -y git curl nano sudo

### Create user
RUN groupadd --gid $useruid $username \
    && useradd --uid $useruid --gid $username --shell /bin/bash --create-home $username
RUN usermod -a -G root $username \
    && chmod 777 -R /var/log \
    && echo "%$USERNAME ALL=(ALL:All) NOPASSWD:ALL" >> /etc/sudoers

### Install packages from Debian repository and install php-extensions
RUN apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libssl-dev \
        libcurl4-openssl-dev \
        pkg-config \
        libedit-dev \
        zlib1g-dev \
        libicu-dev \
        libxml2-dev \
        libpq-dev \
        libaio1

# Oracle
ADD oracle/*.deb /oracle/

RUN dpkg -i /oracle/oracle-instantclient-basic.deb \
    && dpkg -i /oracle/oracle-instantclient-sqlplus.deb \
    && dpkg -i /oracle/oracle-instantclient-devel.deb

RUN echo "/usr/lib/oracle/12.2/client64/lib" > /etc/ld.so.conf.d/oracle-instantclient.conf \
#    && echo 'extension=/usr/local/lib/php/extensions/no-debug-non-zts-20160303/oci8.so' > /usr/local/etc/php/conf.d/docker-php-ext-oci8.ini \
     && ldconfig
# Oracle

### extensions install
RUN docker-php-ext-install -j$(nproc) iconv curl json opcache readline intl bcmath zip xml mbstring soap \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install oci8 \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pgsql pdo_pgsql

### Pecl extensions install
RUN pecl install redis-4.0.1 \
    && pecl install xdebug-2.6.0 \
    && docker-php-ext-enable redis xdebug \
    && mv /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini /usr/local/etc/php/conf.d/docker-php-ext-xdebug.disabled

### Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

### User rights for config
RUN chown $username:$username -R /usr/local/etc/php/conf.d/

### Switchable entrypoint
COPY entrypoint.sh /usr/local/bin/docker-php-entrypoint
RUN chown $username:$username /usr/local/bin/docker-php-entrypoint \
    && chmod 777 /usr/local/bin/docker-php-entrypoint \
    && chmod +x /usr/local/bin/docker-php-entrypoint

### Debuggable php
# RUN ["cp", "/usr/local/bin/php", "/usr/local/bin/php_orig"]
# RUN ["rm", "-rf", "/usr/local/bin/php"]
#    && rm -rf /usr/local/bin/php
COPY debuggable-php.sh /usr/local/bin/debuggable-php
RUN chown root:staff /usr/local/bin/debuggable-php \
    && chmod 777 /usr/local/bin/debuggable-php \
    && chmod +x /usr/local/bin/debuggable-php

### Install ssh
RUN apt-get install -y openssh-server \
    && mkdir /var/run/sshd \
    && echo $username:$username | chpasswd \
    && sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && sed -i 's/#ListenAddress 0.0.0.0/ListenAddress 0.0.0.0/' /etc/ssh/sshd_config \
    && sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd \
    && echo "export VISIBLE=now" >> /etc/profile

USER $username
