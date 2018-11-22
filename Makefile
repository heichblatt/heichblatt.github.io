.PHONY: all build-image clean deepclean serve test-all test-doctor test-build test-inspec

CONTAINER_NAME ?= www-hanneseichblatt-de
IMAGE_NAME ?= local/jekyll:latest
CURL_OPTS ?= -Iv --connect-timeout 15 --retry-connrefused --retry-delay 2
DOCKER_BUILD_OPTS ?= --pull --no-cache -t $(IMAGE_NAME)
DOCKER_RUN_OPTS ?= --name $(CONTAINER_NAME) --rm --volume="$(PWD):/var/jekyll"
JEKYLL_SERVE_OPTS ?=--host 0.0.0.0 --verbose --trace

all: deepclean build-image test-all deepclean

build-image:
	docker build $(DOCKER_BUILD_OPTS) .

clean:
	-docker rm -f $(CONTAINER_NAME)
	-rm -f test/inspec.lock

deepclean: clean
	-docker rmi -f $(IMAGE_NAME)

serve: clean
	docker run --detach -p=4000:4000 $(DOCKER_RUN_OPTS) $(IMAGE_NAME) jekyll serve $(JEKYLL_SERVE_OPTS)

test-all: test-doctor test-build test-inspec
	docker run --volume="$(PWD):/var/jekyll" $(IMAGE_NAME) rm -rfv _site .sass-cache

test-doctor:
	docker run $(DOCKER_RUN_OPTS) $(IMAGE_NAME) jekyll doctor

test-build:
	docker run $(DOCKER_RUN_OPTS) $(IMAGE_NAME) jekyll build --verbose --trace

test-inspec: serve
	until docker logs $(CONTAINER_NAME) | grep -q 'Server running...' ; do \
	  sleep 1 ; \
	done
	inspec exec -t docker://$(CONTAINER_NAME) test/
