FROM alpine:latest

LABEL maintainer="<pbesson@student.42lyon.fr>"

RUN apk update
RUN apk add nginx
RUN apk add openssl
RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./index/index.html /var/www/
COPY ./index/style.css /var/www/
COPY ./index/docker_background.jpg /var/www/
COPY ./index/mysql-logo.png /var/www/
COPY ./index/WordPress_blue_logo.png /var/www/

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj \
    '/C=FR/ST=Auvergne-Rhone-Alpes/L=Lyon/emailAddress=pbesson@student.42lyon.fr' \
    -keyout /etc/ssl/certs/localhost.key -out \
    /etc/ssl/certs/localhost.crt

CMD nginx -g 'pid /tmp/nginx.pid; daemon off;'

EXPOSE 80 443