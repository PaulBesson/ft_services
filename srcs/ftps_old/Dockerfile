# FROM alpine:3.12

# RUN apk update
# RUN apk upgrade

# # serveur FTP vsftpd = Very Secure File Transfer Protocol Deamon
# RUN apk add vsftpd openssl openrc bash

# #RUN cp -i /etc/vsftpd.conf /etc/vsftpd.conf_BACKUP

# RUN openrc
# RUN touch /run/openrc/softlevel

# # folder for ssl certificate
# RUN mkdir -p /etc/ssl-vsftpd/private
# RUN chmod 700 /etc/ssl-vsftpd/private

# # ssl certificate (self-signed)
# RUN openssl req -x509 -nodes -days 365 -newkey rsa:1024 -subj \
# 	'/C=FR/ST=Auvergne-Rhone-Alpes/L=Lyon/emailAddress=pbesson@student.42lyon.fr' \
# 	-keyout /etc/ssl-vsftpd/private/vsftpd.pem \
# 	-out /etc/ssl-vsftpd/private/vsftpd.pem

# COPY vsftpd.conf /etc/vsftpd/vsftpd.conf
# COPY script.sh ./
# RUN chmod +x ./script.sh


# EXPOSE 21 10000

# RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.13.3-static_linux_amd64.tar.gz
# RUN tar -zxvf telegraf-1.13.3-static_linux_amd64.tar.gz
# COPY telegraf.conf etc/telegraf/telegraf.conf

# RUN adduser -D admin
# RUN echo "admin:password" | chpasswd
# RUN touch /home/admin/test.txt


# COPY vsftpd.userlist /etc/vsftpd.userlist


# CMD ./telegraf/telegraf & bash script.sh


FROM alpine:3.12

EXPOSE 21 20 10000

RUN apk update --no-cache
RUN apk upgrade --no-cache
RUN apk add openrc
RUN apk add vsftpd
RUN apk add openssl
RUN openrc boot


RUN openssl req -new -x509 -days 365 -nodes -out /etc/ssl/private/vsftpd.cert.pem -keyout /etc/ssl/private/vsftpd.key.pem \
   -subj "/C=FR/ST=France/L=Lyon/O=42Lyon/OU=42Network/CN=localhost/emailAddress=akerdeka@student.42lyon.fr"


RUN adduser -D -g 'admin' admin
RUN echo "admin:admin" | chpasswd

RUN mkdir -p /etc/vsftpd/ssl

COPY ./vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY ./vsftpd.userlist ./etc/vsftpd.userlist
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.13.3-static_linux_amd64.tar.gz
RUN tar -xvf telegraf-1.13.3-static_linux_amd64.tar.gz
COPY ./telegraf.conf etc/telegraf/telegraf.conf

COPY ./script.sh /script.sh
RUN chmod +x /script.sh

ENTRYPOINT ["sh", "/script.sh"]