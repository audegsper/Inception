FROM	debian:buster

COPY	./tools/setup_wordpress.sh /tmp/
COPY	./conf/wp-config.php /tmp/

RUN		apt-get update -y
RUN		apt-get install -y php7.3-fpm
RUN		apt-get install -y php-mysql
RUN		apt-get install -y tar
RUN		apt-get install -y wget

RUN		wget https://wordpress.org/latest.tar.gz
RUN		tar xzvf latest.tar.gz

CMD		sh /tmp/setup_wordpress.sh

EXPOSE	9000
