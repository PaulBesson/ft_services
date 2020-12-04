FROM alpine

RUN apk update
RUN apk upgrade

# serveur FTP vsftpd = Very Secure File Transfer Protocol Deamon
RUN apk add vsftpd openssl

#RUN cp -i /etc/vsftpd.conf /etc/vsftpd.conf_BACKUP

# folder for ssl certificate
RUN mkdir -p /etc/ssl-vsftpd/private
RUN chmod 700 /etc/ssl-vsftpd/private

# ssl certificate
RUN openssl req -x509 -nodes -days 365 -newkey rsa:1024 -subj \
	'/C=FR/ST=Auvergne-Rhone-Alpes/L=Lyon/emailAddress=pbesson@student.42lyon.fr' \
	-keyout /etc/ssl-vsftpd/private/vsftpd.pem \
	-out /etc/ssl-vsftpd/private/vsftpd.pem



EXPOSE 21