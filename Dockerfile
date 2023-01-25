FROM golang:latest
ENV SOURCE_DIRECTORY /var/hugo

WORKDIR ${SOURCE_DIRECTORY}
VOLUME ${SOURCE_DIRECTORY}
EXPOSE 1313

RUN go install github.com/gohugoio/hugo@latest

ENV CHEF_LICENSE accept
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
        ruby \
        rubygems \
        ruby-dev \
        curl \
    && apt-get clean \
    && gem install --no-document rake inspec-bin