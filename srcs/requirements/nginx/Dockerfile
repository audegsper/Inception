FROM		debian:buster

RUN 		apt-get update -y
RUN			apt-get install -y nginx
RUN			apt-get install -y openssl

COPY		./tools/setup_nginx.sh /tmp/
COPY		./conf/default /etc/nginx/sites-available/default
COPY		./conf/hosts /etc/

RUN			sh /tmp/setup_nginx.sh

EXPOSE		443

ENTRYPOINT	["nginx", "-g", "daemon off;"]
