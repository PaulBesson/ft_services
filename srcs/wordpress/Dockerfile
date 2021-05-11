FROM alpine:3.12

RUN apk update --no-cache
RUN apk upgrade --no-cache
RUN apk add wget
RUN apk add nginx
RUN apk add openrc
RUN apk add php-fpm
RUN apk add php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom

RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /www
RUN mkdir -p /usr/share/webapps/
RUN wget http://wordpress.org/latest.tar.gz
RUN tar -xvf latest.tar.gz
RUN mv /wordpress /usr/share/webapps/
RUN rm latest.tar.gz

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./wp-config.php /usr/share/webapps/wordpress/wp-config.php

RUN openrc
RUN touch /run/openrc/softlevel

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.13.3-static_linux_amd64.tar.gz
RUN tar -zxvf telegraf-1.13.3-static_linux_amd64.tar.gz
COPY telegraf.conf etc/telegraf/telegraf.conf

CMD ./telegraf/telegraf & php-fpm7; nginx -g 'pid /tmp/nginx.pid; daemon off;'

EXPOSE 5050