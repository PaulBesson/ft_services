FROM alpine

RUN apk update
RUN apk upgrade

# serveur FTP vsftpd = Very Secure File Transfer Protocol Deamon
RUN apk add vsftpd openssl openrc bash

#RUN cp -i /etc/vsftpd.conf /etc/vsftpd.conf_BACKUP

# folder for ssl certificate
RUN mkdir -p /etc/ssl-vsftpd/private
RUN chmod 700 /etc/ssl-vsftpd/private

# ssl certificate (self-signed)
RUN openssl req -x509 -nodes -days 365 -newkey rsa:1024 -subj \
	'/C=FR/ST=Auvergne-Rhone-Alpes/L=Lyon/emailAddress=pbesson@student.42lyon.fr' \
	-keyout /etc/ssl-vsftpd/private/vsftpd.pem \
	-out /etc/ssl-vsftpd/private/vsftpd.pem

COPY vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY script.sh ./

VOLUME [ “/sys/fs/cgroup” ]
RUN chmod 777 /sys/fs/cgroup

RUN openrc
RUN touch /run/openrc/softlevel

RUN addgroup ftps_users
RUN adduser -D -g 'password' User
##RUN passwd Password

##add user to group
RUN addgroup User ftps_users
##add default folder (comented)
##RUN addgroup -d /var/www User

EXPOSE 21

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.13.3-static_linux_amd64.tar.gz
RUN tar -zxvf telegraf-1.13.3-static_linux_amd64.tar.gz
COPY telegraf.conf etc/telegraf/telegraf.conf

CMD ./telegraf/telegraf & bash script.sh