all:
	docker-compose -f srcs/docker-compose.yml up

stop:
	docker-compose -f srcs/docker-compose.yml down


cleani:
	@IMAGES=$$(docker image ls -q);\
	if [ -n "$$IMAGES" ]; then docker image rm -f $$IMAGES; fi
	
cleanc:
	@CONTAINERS=$$(docker container ls -qa);\
	if [ -n "$$CONTAINERS" ]; then docker container rm -f $$CONTAINERS; fi

re:
	docker-compose -f srcs/docker-compose.yml up --build




