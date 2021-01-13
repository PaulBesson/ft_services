FROM alpine

RUN apk update
RUN apk upgrade
RUN apk add mysql mysql-client
RUN apk add openrc

#VOLUME [ "/var/lib/mysql" ]
COPY ./start.sh ./
COPY ./mariadb-server.cnf /etc/my.cnf.d/

COPY wordpress.sql ./wordpress.sql

#ENTRYPOINT ["sh","start.sh"]

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.13.3-static_linux_amd64.tar.gz
RUN tar -zxvf telegraf-1.13.3-static_linux_amd64.tar.gz
COPY telegraf.conf etc/telegraf/telegraf.conf

CMD ./telegraf/telegraf & sh start.sh

EXPOSE 3306