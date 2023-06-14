config=/var/html/www/wp-config.php

sleep 10

if [ ! -f $config ] ;
then
  wp config create        --allow-root \
  --dbname=$SQL_DATABASE \
  --dbuser=$SQL_USER \
  --dbpass=$SQL_PASSWORD \
  --dbhost=mariadb:3306 --path='/var/html/www/wordpress'
fi

wp core install --allow-root --url=odessein.42.fr --title=Inception --admin_user=admin --admin_passowd=$WP_PASSWORD --admin_email=odessein@student.42.fr
wp user create --allow-root basic_user basic_user@student.42.fr --role=contributor

/usr/sbin/php-fpm7.4 -F
