FROM fedora:22
MAINTAINER Hannes Eichblatt <mail@hanneseichblatt.de>

ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN yum install -y epel-release && \
    yum install -y nodejs rubygems ruby-devel gcc make && \
    yum clean all
RUN gem install --verbose --no-rdoc --no-ri RedCloth
RUN gem install --verbose --no-rdoc --no-ri jekyll

WORKDIR /srv/www

EXPOSE 4000
CMD ["jekyll", "serve", "--watch", "--host=0.0.0.0"]

ADD . /srv/www/
