FROM heichblatt/jekyll
MAINTAINER heichblatt

ADD . /usr/src/blog/
WORKDIR /usr/src/blog
RUN jekyll doctor && jekyll build -V

EXPOSE 4000
ENTRYPOINT ["jekyll", "serve", "--watch", "--host=0.0.0.0"]
