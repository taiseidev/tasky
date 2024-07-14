.PHONY: up down logs

up:
	cd ../tasky_server && docker-compose up --build -d

down:
	cd ../tasky_server && docker-compose down

logs:
	docker ps -a
	docker logs tasky_server-app-1
