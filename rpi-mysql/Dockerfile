FROM resin/rpi-raspbian:wheezy

ENV MYSQL_VERSION 5.5.41-0+wheezy1

RUN groupadd -r mysql && useradd -r -g mysql mysql

RUN apt-get update && apt-get install -y mysql-server
RUN sed -Ei 's/^(bind-address|log)/#&/' /etc/mysql/my.cnf

VOLUME /var/lib/mysql

COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 3306
CMD ["mysqld", "--datadir=/var/lib/mysql", "--user=mysql"]
