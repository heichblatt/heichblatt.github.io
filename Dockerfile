FROM jekyll/jekyll

EXPOSE 4000
ENTRYPOINT ["jekyll", "serve", "--watch", "--host=0.0.0.0"]
WORKDIR /srv/jekyll

ADD . /srv/jekyll
RUN jekyll doctor && jekyll build -V
