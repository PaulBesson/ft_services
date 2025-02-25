# setup mysql
mysql_install_db --user=mysql --datadir=/var/lib/mysql
mkdir /run/openrc
touch /run/openrc/softlevel
#/etc/init.d/mariadb setup
openrc
rc-service mariadb start

echo "CREATE DATABASE wordpress;" | mysql -u root # create database
echo "CREATE USER 'admin'@'%' IDENTIFIED BY 'password';" | mysql -u root # user
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'admin'@'%';" | mysql -u root # user = root
echo "FLUSH PRIVILEGES;" | mysql -u root
rc-service mariadb restart

mysql -u root wordpress < wordpress.sql

rc-service mariadb restart

while true; do
    sleep 1;
done