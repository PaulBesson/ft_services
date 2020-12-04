FROM alpine

RUN apk update
RUN apk upgrade
RUN apk add nginx
RUN apk add php7-common php7-iconv php7-json php7-gd php7-curl
RUN apk add php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo
RUN apk add php7-pdo_mysql php7-soap php7-xmlrpc php7-posix
RUN apk add php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom
RUN apk add php-fpm php-session

RUN mkdir -p /usr/share/webapps/
RUN cd /usr/share/webapps
RUN wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz
RUN tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz
RUN rm phpMyAdmin-5.0.2-all-languages.tar.gz
RUN mv phpMyAdmin-5.0.2-all-languages phpmyadmin
RUN mv phpmyadmin /usr/share/webapps/
RUN chmod -R 755 /usr/share/webapps/
RUN ln -s /usr/share/webapps/phpmyadmin/ /var/www/localhost/htdocs/phpmyadmin

RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /usr/share/webapps/
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY config.inc.php /usr/share/webapps/

CMD php-fpm7; nginx -g 'pid /tmp/nginx.pid; daemon off;'

EXPOSE 5000