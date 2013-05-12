deploy:
	rsync --delete -avh _site/ he.de:public/hanneseichblatt.de
