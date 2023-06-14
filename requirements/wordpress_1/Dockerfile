FROM debian:bullseye

WORKDIR /var/html/www

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y	install wget \
						php7.4 \
						php-fpm \
						php-mysql \
						mariadb-client \
						curl

RUN cd /tmp && wget "https://wordpress.org/latest.tar.gz" && tar -xvf latest.tar.gz
RUN mv /tmp/wordpress /var/html/www/odessein.42.fr
RUN chown -R www-data:www-data /var/html/www/odessein.42.fr
RUN chown -R 755 /var/html/www/odessein.42.fr
RUN cd odessein.42.fr && rm wp-config-sample.php
COPY ./wp-config.php odessein.42.fr/
COPY ./script.sh ./odessein.42.fr/

RUN mkdir -p /var/run/php
COPY ./www.conf /etc/php/7.4/fpm/pool.d/www.conf
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

EXPOSE 9000

#ENTRYPOINT ["/bin/bash"]

ENTRYPOINT ["/bin/bash", "-c", "/var/html/www/odessein.42.fr/script.sh"]
