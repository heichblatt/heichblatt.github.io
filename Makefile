.PHONY: all build-image clean deepclean serve test-all test-doctor test-build test-inspec

CONTAINER_NAME ?= www-hanneseichblatt-de
IMAGE_NAME ?= local/jekyll:latest
CURL_OPTS ?= -Iv --connect-timeout 15 --retry-connrefused --retry-delay 2
DOCKER_BUILD_OPTS ?= --pull --no-cache -t $(IMAGE_NAME)
DOCKER_RUN_OPTS ?= --name $(CONTAINER_NAME) --rm --volume="$(PWD):/var/jekyll"
JEKYLL_OUTPUT_DIR ?= /var/jekyll-generated
JEKYLL_SERVE_OPTS ?= --host 0.0.0.0 --destination $(JEKYLL_OUTPUT_DIR) --verbose --trace
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
	docker run --detach -p=4000:4000 $(DOCKER_RUN_OPTS) $(IMAGE_NAME) jekyll serve --safe $(JEKYLL_SERVE_OPTS)

test-all: test-doctor test-build test-inspec

test-doctor:
	docker run $(DOCKER_RUN_OPTS) $(IMAGE_NAME) jekyll doctor

test-build:
	docker run $(DOCKER_RUN_OPTS) $(IMAGE_NAME) jekyll build --destination $(JEKYLL_OUTPUT_DIR) --safe --verbose --trace

test-inspec: serve
	until docker logs $(CONTAINER_NAME) | grep -q 'Server running...' ; do \
	  sleep 1 ; \
	done
	docker exec -ti $(CONTAINER_NAME) inspec exec -b local /var/jekyll/test/ --reporter cli junit:./junit.xml

# to avoid errors about timestamps, we omit '-t', 'rlpgoD' is simply '-a' without '-t'
deploy-keybase:
	rsync -rlpgoDvPh --delete ./_site/ pgp_keys.asc preseed.cfg $(DEPLOY_DIR)
