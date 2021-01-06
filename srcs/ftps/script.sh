
RUN mkdir /home/admin/ftp && chown nobody:nogroup /home/admin/ftp
RUN chmod a-w /home/admin/ftp/
RUN mkdir /home/admin/ftp/files && chown admin:password /home/admin/ftp/files

service vsftpd start

while true; do
    sleep 1;
done