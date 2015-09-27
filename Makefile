TAG ?= heichblatt/jekyll-www-he.de
JOB_NAME ?= www-hanneseichblatt-de
BUILD_NUMBER ?= latest

build:
	time jekyll build

clean:
	rm -rf ./_site

deploy:
	-/bin/docker-compose stop
	-/bin/docker-compose rm -f
	/bin/docker-compose build
	/bin/docker-compose up -d
	/bin/sudo /bin/systemctl reload httpd