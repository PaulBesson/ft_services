
RUN mkdir /home/admin/ftp && chown nobody:nogroup /home/admin/ftp
RUN chmod a-w /home/admin/ftp/
RUN mkdir /home/admin/ftp/files && chown admin:password /home/admin/ftp/files

service vsftpd start

#
sudo mkdir /etc/ssl/private
openssl req -x509 -nodes -days 365 -newkey rsa:1024 -subj \
	'/C=FR/ST=Auvergne-Rhone-Alpes/L=Lyon/emailAddress=pbesson@student.42lyon.fr' \
	-keyout /etc/ssl-vsftpd/private/vsftpd.pem \
	-out /etc/ssl-vsftpd/private/vsftpd.pem
sudo ufw allow 990/tcp
sudo ufw allow 40000:50000/tcp
sudo ufw status
$ systemctl restart vsftpd
#

while true; do
    sleep 1;
done