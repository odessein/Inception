FROM debian:bullseye

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get -y install mariadb-server
RUN mkdir /var/run/mysqld; \
	chmod 777 /var/run/mysqld;

COPY ./my.cnf ~/my.cnf

ADD setup.sh setup.sh

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

RUN chown -R mysql:mysql /var/lib/mysql

EXPOSE 3306

#CMD mariadb -u root --password=pass < config.sql
 
ENTRYPOINT ["/bin/bash", "-c", "/setup.sh"]
