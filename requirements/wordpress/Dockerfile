FROM debian:bullseye

WORKDIR /var/html/www

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y	install wget \
						mariadb-client \
						php-fpm \
						php-mysql \
						lsb-release \
						ca-certificates \
						apt-transport-https \
						software-properties-common \
						gnupg2 \
						curl
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/sury-php.list
RUN curl -fsSL  https://packages.sury.org/php/apt.gpg | gpg --dearmor -o /etc/apt/trusted.gpg.d/sury-keyring.gpg
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xvf latest.tar.gz
RUN rm -rf latest.tar.gz
RUN apt-get -y update
#RUN apt-get -y install php8.1-fpm
RUN mkdir -p /var/run/php
#RUN chown -R root:root /var/www/wordpress
RUN mkdir -p /var/html/www/wordpress/conf
COPY ./script.sh /var/html/www/wordpress/conf
COPY ./www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
#VOLUME . /usr/src/wordpress

EXPOSE 9000

ENTRYPOINT ["/bin/bash", "-c", "/var/html/www/wordpress/conf/script.sh"]
