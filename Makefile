deploy: build
	rsync --delete -avh _site/ he.de:public/hanneseichblatt.de

build:
	time jekyll build