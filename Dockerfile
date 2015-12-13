FROM centos:7
MAINTAINER heichblatt

ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN yum install -y rubygems ruby-devel gcc make nodejs && \
    yum clean all
RUN gem install --verbose --no-rdoc --no-ri jekyll pygments.rb RedCloth

ADD . /usr/src/blog/
WORKDIR /usr/src/blog

RUN jekyll doctor && jekyll build -V

EXPOSE 4000
ENTRYPOINT ["jekyll", "serve", "--watch", "--host=0.0.0.0"]
