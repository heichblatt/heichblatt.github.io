FROM fedora:22
MAINTAINER heichblatt

ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN yum install -y rubygems ruby-devel rubygem-RedCloth gcc make nodejs httpd redhat-rpm-config && \
    yum clean all
RUN gem install --verbose --no-rdoc --no-ri jekyll pygments.rb

ADD . /usr/src/blog/
RUN jekyll build --destination /var/www/html --source /usr/src/blog

EXPOSE 80
ENTRYPOINT ["/usr/sbin/httpd", "-DFOREGROUND"]
