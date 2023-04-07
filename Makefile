DC=docker-compose
UP=@$(DC) -f docker-compose.yml up -d
APP=app
APP-EXEC=$(DC) exec $(APP)
BASH=/bin/bash
SH=/bin/sh

build-and-up:
	@$(UP) --build --remove-orphans

db-create-volume:
	@$(RUN) docker volume create --name=clickhouse.data

db-remove-volume:
	@$(RUN) docker volume rm clickhouse.data -f

copy-env:
	@$(RUN) cp .env.dist .env 2>/dev/null

install:
	make copy-env
	make db-create-volume
	make build-and-up

pull:
	@$(DC) pull

recreate:
	@$(UP) --force-recreate

remove:
	@$(DC) down -v --rmi all --remove-orphans
	make db-remove-volume

ps:
	@$(DC) ps

sh:
	$(APP-EXEC) $(BASH)

stop:
	@$(DC) stop

up:
	@$(UP)

wait:
	@echo "Waiting for container to be healthy"
	@$(RUN) sleep 1m