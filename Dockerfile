FROM fedora:21
MAINTAINER Hannes Eichblatt <mail@hanneseichblatt.de>

ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN yum install -y rubygems ruby-devel rubygem-RedCloth gcc make nodejs
RUN gem install --verbose --no-rdoc --no-ri jekyll

WORKDIR /srv/www

ADD . /srv/www/

EXPOSE 4000
CMD ["jekyll", "serve", "--watch"]
