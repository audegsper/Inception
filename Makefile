all : up

up :
	sudo date -s "$$(wget -qSO- --max-redirect=0 google.com 2>&1 | grep Date: | cut -d' ' -f5-8)Z"
	sudo mkdir -p ${HOME}/data/wordpress ${HOME}/data/database
	sudo docker-compose -f srcs/docker-compose.yml up -d --build
	sudo cp -rp ./srcs/requirements/nginx/conf/hosts /etc/hosts
	sudo chmod 777 /etc/hosts

fdown :
	sudo docker stop $$(sudo docker ps -a -q)
	sudo docker rm $$(sudo docker ps -a -q)
	sudo docker rmi -f $$(sudo docker images -q)
	sudo docker system prune -f
	sudo rm -rf ${HOME}/data

ps :
	sudo docker-compose -f srcs/docker-compose.yml ps

stop_wp :
	sudo docker stop c_wordpress
	sudo docker rm c_wordpress
	sudo docker rmi -f wordpress
	sudo rm -rf ${HOME}/data/wordpress

exec_db :
	sudo docker exec -it c_mariadb bash

exec_wp :
	sudo docker exec -it c_wordpress bash

exec_nx :
	sudo docker exec -it c_nginx bash

log_db :
	sudo docker logs -t c_mariadb

log_nx :
	sudo docker logs -t c_nginx

log_wp :
	sudo docker logs -t c_wordpress

