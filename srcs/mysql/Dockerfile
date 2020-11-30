FROM alpine

RUN apk update
RUN apk add mysql mysql-client
RUN apk add openrc
RUN chown -R www:www /etc
VOLUME [ "/var/lib/mysql" ]
COPY ./start.sh ./
COPY ./mysql.cnf /etc/my.cnf.d/mariadb-server.cnf

CMD sh start.sh