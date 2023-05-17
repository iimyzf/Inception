build:
		docker-compose -f srcs/docker-compose.yml build

up:
		docker-compose -f srcs/docker-compose.yml up

down:
		docker-compose -f srcs/docker-compose.yml down -v
