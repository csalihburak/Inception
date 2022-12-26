build:
	@cd srcs && docker-compose build

run:
	@cd srcs && docker-compose up -d

stop:
	@cd srcs && docker-compose stop

down:
	@cd srcs && docker-compose down -v

remove-images:
	@cd srcs && docker-compose down --rmi all

remove-networks:
	@cd srcs && docker-compose down --remove-orphans

re: remove-images remove-networks build run