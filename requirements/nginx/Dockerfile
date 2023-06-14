FROM debian:bullseye

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install nginx
RUN apt-get -y install openssl 
RUN apt-get -y	install	lsb-release \
						ca-certificates \
						apt-transport-https \
						software-properties-common \
						gnupg2 \
						curl

RUN mkdir -p /etc/nginx/ssl
RUN mkdir -p /var/run/nginx

RUN apt-get -y update

RUN openssl req -x509 -newkey rsa:4096 -sha256 -keyout /etc/nginx/ssl/odessein.42.fr.key -out /etc/nginx/ssl/odessein.42.fr.cert -subj "/CN=odessein.42.fr/C=US/ST=California/L=San Fransisco/O=42 Paris/OU=Common Core" -nodes

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

#Run command to setup openssl

EXPOSE 443

ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]
