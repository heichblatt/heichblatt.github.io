FROM heichblatt/jekyll
MAINTAINER heichblatt

EXPOSE 4000
ENTRYPOINT ["jekyll", "serve", "--watch", "--host=0.0.0.0"]

ADD . /target
WORKDIR /target
RUN jekyll doctor && jekyll build -V
