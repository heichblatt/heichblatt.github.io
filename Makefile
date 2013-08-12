build:
	time jekyll build

deploy: build
	rsync --delete -avh _site/ he.de:public/hanneseichblatt.de