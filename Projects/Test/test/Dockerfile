FROM phusion/baseimage:latest

ENV DEBIAN_FRONTEND="noninteractive" \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8 \
    TERM=xterm \
    TZ=Europe/Moscow \
    PHP_IDE_CONFIG=serverName=test \
    NOTVISIBLE="in users profile" \
    CI_DATABASE_HOST=mysql \
    HOST=test

### Install packages from Debian repository and install php-extensions
RUN curl -o /usr/local/bin/gosu -L https://github.com/tianon/gosu/releases/download/1.9/gosu-amd64 \
    && chmod +x /usr/local/bin/gosu \
    && apt-add-repository -y ppa:ondrej/php \
    && apt-add-repository -y ppa:brightbox/ruby-ng \
    && apt-get update \
    && apt-get install -y --no-install-recommends git-core openssh-client vim nano less tree \
    && apt-get install -y \
        zsh \
        net-tools \
        iputils-ping \
        build-essential \
        ruby2.2 ruby2.2-dev \
        curl \
        mysql-client \
        php7.1-cli \
        php7.1-fpm \
        php7.1-common \
        php7.1-curl \
        php7.1-gd \
        php7.1-json \
        php7.1-mysql \
        php7.1-pgsql \
        php7.1-opcache \
        php7.1-readline \
        php7.1-sqlite3 \
        php7.1-intl \
        php7.1-bcmath \
        php7.1-zip \
        php7.1-xml \
        php7.1-mbstring \
        php7.1-soap \
        php-xdebug \
        php-redis \
   && rm -r /var/lib/apt/lists/* \
   && mkdir /run/php

### Install supervisor
RUN apt-get update && apt-get install -y supervisor \
    && mkdir -p  /var/log/supervisor

### Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

ARG useruid

RUN groupadd --gid $useruid test \
    && useradd --create-home --uid $useruid --gid $useruid --shell /bin/zsh test \
    && mkdir /home/test/.ssh 
    && touch /home/test/.ssh/config 
    && chown -R $useruid:$useruid /home/test/.ssh
    
RUN cd /home/test && su -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" test


WORKDIR /var/www/test

CMD ["/usr/bin/supervisord"]
