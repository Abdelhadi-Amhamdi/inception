all:
	mkdir -p /home/aamhamdi/data/mariadb
	mkdir -p /home/aamhamdi/data/wordpress
	docker-compose -f srcs/docker-compose.yml build
	docker-compose -f srcs/docker-compose.yml up

stop:
	docker-compose -f srcs/docker-compose.yml down






