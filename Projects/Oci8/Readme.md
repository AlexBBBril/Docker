### PHP:7.2-fpm, NGINX, REDIS, PostgreSQL, Oracle Instant Client 12.2

#### Running docker containers in three environments: dev, test, ci.
* **Dev-env** - Has an Xdebug. Ports is open for access.
* **Test-env** - By default, Xdebug does't work. In debug mode, Xdebug is started
* **CI-env** - Has an Xdebug. Ports is close for access.

#### Includes OCI8 php extension
OCI8 - is extension for connection with Oracle Instant Client 12.2.
