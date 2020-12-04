FROM alpine

RUN apk update
RUN apk upgrade
RUN apk add mysql mysql-client
RUN apk add openrc

VOLUME [ "/var/lib/mysql" ]
COPY ./start.sh ./
COPY ./mariadb-server.cnf /etc/my.cnf.d/

ENTRYPOINT ["sh","start.sh"]

EXPOSE 3306