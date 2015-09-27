TAG ?= heichblatt/jekyll-www-he.de
JOB_NAME ?= www-hanneseichblatt-de
BUILD_NUMBER ?= latest

build:
	time jekyll build

deploy:
	/bin/docker stop $JOB_NAME || true
	/bin/docker rm $JOB_NAME || true
	/bin/docker run -d --name $JOB_NAME -p 4000:4000 $JOB_NAME:$BUILD_NUMBER && \
	/bin/sudo /bin/systemctl reload httpd

run: build-docker deploy-docker

build-docker:
	docker build -t $(TAG) .

deploy-docker:
	docker run -p 80:4000 $(TAG) 

clean:
	rm -rf ./_site
