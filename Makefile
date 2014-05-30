TAG ?= heichblatt/jekyll-www-he.de

build:
	time jekyll build

deploy: build
	rsync --delete -avh _site/ he.de:public/hanneseichblatt.de

run: build-docker deploy-docker

build-docker:
	docker build -t $(TAG) .

deploy-docker:
	docker run -p 80:4000 $(TAG) 
