TAG ?= heichblatt/jekyll-www-he.de
JOB_NAME ?= www-hanneseichblatt-de
BUILD_NUMBER ?= latest

build:
	time jekyll build

clean:
	rm -rf ./_site

deploy:
	/bin/docker stop $(JOB_NAME) || true
	/bin/docker rm $(JOB_NAME) || true
	/bin/docker run -d --name $(JOB_NAME) -p 4000:4000 $(JOB_NAME):$(BUILD_NUMBER) && \
	/bin/sudo /bin/systemctl reload httpd