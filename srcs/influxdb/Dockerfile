FROM alpine:latest

RUN apk update

RUN apk add influxdb

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.13.3-static_linux_amd64.tar.gz
RUN tar -zxvf telegraf-1.13.3-static_linux_amd64.tar.gz
COPY telegraf.conf etc/telegraf/telegraf.conf
COPY ./start.sh .

CMD sh ./start.sh

EXPOSE 8086