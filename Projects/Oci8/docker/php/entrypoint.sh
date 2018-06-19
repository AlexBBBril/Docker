#!/bin/sh
set -e

#switch on xdebug
enabled_xdebug="/usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini"
if [ "${DEBUG}" = "1" ]; then
        if [ ! -e "$enabled_xdebug" ]; then
           mv /home/app/docker-php-ext-xdebug.ini /usr/local/etc/php/conf.d/
        fi
fi

#switch on ssh
if [ "${ENABLE_SSH}" = "1" ]; then
       sudo service ssh start
fi

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
        set -- php-fpm "$@"
fi

exec "$@"
