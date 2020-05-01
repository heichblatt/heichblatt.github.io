FROM debian:stable
ENV SOURCE_DIRECTORY /var/jekyll
ENV CHEF_LICENSE accept
RUN apt-get update && \
    apt-get install -y --no-install-recommends build-essential ruby rubygems ruby-dev jekyll curl && \
    apt-get clean && \
    gem install --no-document rake inspec-bin
RUN mkdir -pv ${SOURCE_DIRECTORY} ${SOURCE_DIRECTORY}-generated
WORKDIR ${SOURCE_DIRECTORY}
VOLUME ${SOURCE_DIRECTORY}
EXPOSE 4000
