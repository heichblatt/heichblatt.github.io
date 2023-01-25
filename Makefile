.PHONY: all build-image clean deepclean serve test-all test-build test-inspec deploy-keybase deploy

CONTAINER_NAME ?= www-hanneseichblatt-de
IMAGE_NAME ?= local/hugo:latest
CURL_OPTS ?= -Iv --connect-timeout 15 --retry-connrefused --retry-delay 2
DOCKER_BUILD_OPTS ?= --pull --no-cache -t $(IMAGE_NAME)
DOCKER_RUN_OPTS ?= --workdir /var/hugo --name $(CONTAINER_NAME) --rm --volume="$(PWD):/var/hugo"
HUGO_OUTPUT_DIR ?= /var/hugo-generated
HUGO_SERVE_OPTS ?= --bind 0.0.0.0 --destination $(HUGO_OUTPUT_DIR) --verbose
BUILD_DIR ?= ./build
DEPLOY_DIR ?= /Volumes/Keybase/public/heichblatt/

all: deepclean build-image test-all deepclean

build-image:
	docker build $(DOCKER_BUILD_OPTS) .

clean:
	-docker rm -f $(CONTAINER_NAME)
	-rm -f test/inspec.lock

deepclean: clean
	-docker rmi -f $(IMAGE_NAME)

serve: clean
	docker run --detach -p=1313:1313 $(DOCKER_RUN_OPTS) $(IMAGE_NAME) hugo server $(HUGO_SERVE_OPTS)

test-all: clean test-build test-inspec

test-build:
	docker run $(DOCKER_RUN_OPTS) $(IMAGE_NAME) hugo --destination $(HUGO_OUTPUT_DIR) --verbose

test-inspec: serve
	until docker logs $(CONTAINER_NAME) | grep -q 'Web Server is available' ; do \
	  sleep 1 ; \
	done
	docker exec -ti $(CONTAINER_NAME) inspec exec -b local /var/hugo/test/ --reporter cli junit:./junit.xml

# to avoid errors about timestamps, we omit '-t', 'rlpgoD' is simply '-a' without '-t'
deploy-keybase:
	rsync -rlpgoDvPh --delete ./public/ pgp_keys.asc preseed.cfg $(DEPLOY_DIR)

deploy: deepclean build-image test-all
	rsync -avPh --delete -e ssh --rsync-path="sudo rsync" ./public/ pgp_keys.asc keybase.txt hanneseichblatt.de:/var/www/html/hanneseichblatt.de/