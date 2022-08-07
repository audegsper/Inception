#!bin/bash

rm latest.tar.gz
mv -f /tmp/wp-config.php /var/www/
chown -R www-data:www-data /var/www/

echo "listen = 9000" >> /etc/php/7.3/fpm/pool.d/www.conf
mkdir -p /run/php/

exec php-fpm7.3 -F
