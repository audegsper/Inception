FROM	debian:buster

RUN	 	apt-get update -y
RUN		apt-get install mariadb-server -y

COPY	./tools/setup_mariadb.sh /tmp/
COPY	./conf/my.cnf /etc/mysql/my.cnf
COPY	./conf/wp_dump.sql /tmp/

EXPOSE	3306

CMD		sh /tmp/setup_mariadb.sh
