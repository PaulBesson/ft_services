FROM alpine:3.12

LABEL maintainer="<pbesson@student.42lyon.fr>"

RUN apk update
RUN apk --no-cache add nginx
RUN apk --no-cache add openssl wget

RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./index/index.html /www/
COPY ./index/style.css /www/
COPY ./index/style_dark.css /www/
COPY ./index/mysql-logo.png /www/
COPY ./index/WordPress_blue_logo.png /www/
COPY ./index/phpMyAdmin_logo.svg.png /www/
COPY ./index/Grafana_logo.png /www/
COPY ./index/42_logo.png /www/
COPY ./index/fr.subject.pdf /www/

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.13.3-static_linux_amd64.tar.gz
RUN tar -zxvf telegraf-1.13.3-static_linux_amd64.tar.gz
COPY telegraf.conf etc/telegraf/telegraf.conf

RUN mkdir -p /run/nginx /www /etc/nginx/ssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/certs/localhost.key -out /etc/ssl/certs/localhost.crt \
    -subj "/C=FR/ST=France/L=Lyon/O=42Lyon/OU=42Network/CN=localhost/emailAddress=pbesson@student.42lyon.fr"

EXPOSE 22 80 443

CMD nginx -g 'pid /tmp/nginx.pid; daemon off;' & ./telegraf/telegraf
