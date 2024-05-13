FROM alpine:3.18

RUN apk update && \
    apk add --no-cache mysql mysql-client openrc && \
    rm -f /var/cache/apk/*

COPY ./conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

RUN chmod +x /usr/local/bin/entrypoint.sh

RUN mkdir /run/mysqld

RUN openrc && touch /run/openrc/softlevel
RUN rc-update add mariadb default
RUN rc-service mariadb setup

EXPOSE 3306

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

CMD ["mysqld", "--user=root"]