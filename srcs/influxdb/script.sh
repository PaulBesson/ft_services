openrc
touch /run/openrc/softlevel
rc-service influxdb start

while true; do
	sleep 1;
done