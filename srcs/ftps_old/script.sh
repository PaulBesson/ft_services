
# mkdir /home/admin/ftp && chown nobody:nogroup /home/admin/ftp
# chmod a-w /home/admin/ftp/
# mkdir /home/admin/ftp/files && chown admin:password /home/admin/ftp/files

# service vsftpd start

# #
# mkdir /etc/ssl/private
# openssl req -x509 -nodes -days 365 -newkey rsa:1024 -subj \
# 	'/C=FR/ST=Auvergne-Rhone-Alpes/L=Lyon/emailAddress=pbesson@student.42lyon.fr' \
# 	-keyout /etc/ssl-vsftpd/private/vsftpd.pem \
# 	-out /etc/ssl-vsftpd/private/vsftpd.pem
# #$ systemctl restart vsftpd
# service vsftpd restart
# #

# while true; do
#     sleep 1;
# done



mkdir /home/admin/ftp && chown nobody:nogroup /home/admin/ftp
chmod a-w /home/admin/ftp/
mkdir /home/admin/ftp/files && chown admin:password /home/admin/ftp/files

./telegraf/telegraf & rc-service vsftpd restart

while true; do
    rc-service vsftpd status || rc-service vsftpd restart;
    sleep 5;
done;