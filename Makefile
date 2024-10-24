.PHONY: clean serve test
CONTAINER_NAME ?= www-hanneseichblatt-de

clean:
	docker rm -f $(CONTAINER_NAME)

serve: clean
	docker run -ti \
		-v $(CURDIR):/src \
		-v $(HOME)/hugo_cache:/tmp/hugo_cache \
		--name $(CONTAINER_NAME) \
		-p 1313:1313 \
		hugomods/hugo:exts-non-root server

test:
	pipenv run pytest -v test/*py