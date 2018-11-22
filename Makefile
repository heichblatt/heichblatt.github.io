JOB_NAME ?= www-hanneseichblatt-de
.PHONY = start stop clean
start: stop
	-docker-compose rm --all --force ${JOB_NAME}
	docker-compose up -d --build
	docker-compose ps

stop:
	docker-compose stop -t 10

clean:
	docker-compose down -v
