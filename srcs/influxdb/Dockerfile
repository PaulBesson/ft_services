FROM alpine:latest

RUN apk update

RUN apk add influxdb
RUN apk add openrc

COPY ./script.sh /script.sh

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.13.3-static_linux_amd64.tar.gz
RUN tar -zxvf telegraf-1.13.3-static_linux_amd64.tar.gz
COPY telegraf.conf etc/telegraf/telegraf.conf

CMD ./telegraf/telegraf & sh script.sh

EXPOSE 8086