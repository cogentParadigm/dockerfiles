#!/bin/bash

DUMMY=$(id -g ${PHP_GROUP} || groupadd -g ${PHP_GID} ${PHP_GROUP})
DUMMY=$(id -u ${PHP_USER} || useradd -m -u ${PHP_UID} -g ${PHP_GID} ${PHP_USER})
sed -i "s/^user = .*/user = ${PHP_USER}/" /etc/php-fpm.d/www.conf
sed -i "s/^group = .*/group = ${PHP_GROUP}/" /etc/php-fpm.d/www.conf
$@
