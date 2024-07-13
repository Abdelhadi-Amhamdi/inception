all:
	mkdir -p /home/aamhamdi/data/ma
	mkdir -p /home/aamhamdi/data/wp
	docker-compose -f srcs/docker-compose.yml build --pull
	docker-compose -f srcs/docker-compose.yml up -d

stop:
	docker-compose -f srcs/docker-compose.yml down


cleani:
	@IMAGES=$$(docker image ls -q);\
	if [ -n "$$IMAGES" ]; then docker image rm -f $$IMAGES; fi
	
cleanc:
	@CONTAINERS=$$(docker container ls -qa);\
	if [ -n "$$CONTAINERS" ]; then docker container rm -f $$CONTAINERS; fi

cleanv:
	@CONTAINERS=$$(docker volume ls -q);\
	if [ -n "$$CONTAINERS" ]; then docker volume rm -f $$CONTAINERS; fi

clean: cleani cleanc cleanv

re: stop
	docker-compose -f srcs/docker-compose.yml up --build -d




