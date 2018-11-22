JOB_NAME ?= www-hanneseichblatt-de
.PHONY = start stop clean serve test

start: stop
	docker run --name $(JOB_NAME) --volume="$(PWD):/srv/jekyll" jekyll/jekyll jekyll doctor
	docker run --name $(JOB_NAME) --volume="$(PWD):/srv/jekyll" jekyll/jekyll jekyll build --verbose --trace

stop: clean

clean:
	-docker rm -f $(JOB_NAME)

serve: clean
	docker run --user=root  --name $(JOB_NAME) --detach -p=4000:4000 --volume="$(PWD):/srv/jekyll" jekyll/jekyll jekyll serve --verbose --trace

test: serve
	sleep 5
	curl -Iv localhost:4000 | grep "HTTP/1.1 200 OK"
	$(MAKE) clean
