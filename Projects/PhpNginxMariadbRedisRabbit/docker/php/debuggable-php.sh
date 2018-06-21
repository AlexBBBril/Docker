#!/bin/sh
set -e
enabled_xdebug="/usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini"
case "$@" in
        *-dxdebug.remote_enable=1*)
            if [ ! -e "$enabled_xdebug" ]; then
                mv /home/app/docker-php-ext-xdebug.ini /usr/local/etc/php/conf.d/
            fi
        ;;
        *)
            if [ -e "$enabled_xdebug" ]; then
                mv /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini /home/app/
            fi
        ;;
esac
set -- php "$@"
exec "$@"