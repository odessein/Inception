#!/bin/bash

service mariadb start

echo ahaha "$SQL_ROOT_PASSWORD"
echo a

mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;"
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"

echo c

mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
echo d
mysql -u root -p"$SQL_ROOT_PASSOWRD" -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
echo e
mysql -u root -p"$SQL_ROOT_PASSWORD" -e "FLUSH PRIVILEGES;"
echo f
mysqladmin -u root -p"$SQL_ROOT_PASSWORD" shutdown
echo g

exec mysqld_safe

