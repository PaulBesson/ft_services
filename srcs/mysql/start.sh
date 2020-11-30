# setup mysql
mysql_install_db --user=mysql --datadir=/var/lib/mysql
mkdir /run/openrc
touch /run/openrc/softlevel
#/etc/init.d/mariadb setup
rc-service mariadb start

echo "CREATE DATABASE wordpress;" | mysql -u root # on cree la base de donnee
echo "CREATE USER 'admin'@'localhost' IDENTIFIED BY 'password';" | mysql -u root # on cree l'user
echo "SET PASSWORD FOR root@localhost=PASSWORD('password');" | mysql -u root # le mot de passe
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'admin'@'localhost';" | mysql -u root # le privileges (root)

rc-service mariadb restart

while true; do
    sleep 1;
done