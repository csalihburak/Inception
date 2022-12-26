FROM alpine:3.16

RUN apk update && apk add --no-cache mariadb mariadb-client

COPY requirements/mariadb/conf/conf.sh /usr/local/bin/
COPY requirements/mariadb/tools/create_db.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/create_db.sh
RUN sh /usr/local/bin/conf.sh


ENTRYPOINT [ "/usr/local/bin/create_db.sh" ]

USER mysql

EXPOSE 3306

CMD ["/usr/bin/mysqld", "--skip-log-error"]