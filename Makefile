start:
	cd srcs/ && docker compose up --build

stop:
	cd srcs/ && docker compose down
	yes | docker network prune
	yes | docker image prune

delete_volumes:
	make stop
	docker volume ls -q | xargs docker volume rm

prune:
	docker system prune --all --volumes

web:
	docker exec -it wordpress sh

nginx:
	docker exec -it -w /var/www/ nginx sh

mariadb:
	docker exec -it mariadb sh

.PHONY: start stop prune web nginx mariadb