JOB_NAME ?= www-hanneseichblatt-de

start: stop
	-docker-compose rm --all --force ${JOB_NAME}
	docker-compose up -d --build
	docker-compose ps

stop:
	docker-compose stop -t 10

