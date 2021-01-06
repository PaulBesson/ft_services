FROM alpine:latest

RUN apk update
RUN apk add --no-cache libc6-compat

RUN wget https://dl.grafana.com/oss/release/grafana-7.3.6.linux-amd64.tar.gz
RUN tar -zxvf grafana-7.3.6.linux-amd64.tar.gz

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.13.3-static_linux_amd64.tar.gz
RUN tar -zxvf telegraf-1.13.3-static_linux_amd64.tar.gz
COPY telegraf.conf etc/telegraf/telegraf.conf

COPY ./grafana.db grafana-7.3.6/data/grafana.db

CMD ./telegraf/telegraf & cd ./grafana-7.3.6/bin; ./grafana-server

EXPOSE 3000