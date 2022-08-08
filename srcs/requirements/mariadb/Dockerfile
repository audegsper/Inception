FROM debian:buster

# install mariadb
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install mariadb-server -y

# config mariadb
COPY tools/setup_mariadb.sh /setup_mariadb.sh
COPY ./conf/my.cnf /etc/mysql/my.cnf
COPY ./conf/wp_dump.sql ./

ENTRYPOINT ["sh", "./setup_mariadb.sh"]

EXPOSE 3306
