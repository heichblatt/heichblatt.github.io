FROM debian:stable
ENV SOURCE_DIRECTORY /var/jekyll
RUN apt-get update && \
    apt-get install -y --no-install-recommends jekyll curl && \
    apt-get clean
RUN mkdir -pv ${SOURCE_DIRECTORY} ${SOURCE_DIRECTORY}-generated
WORKDIR ${SOURCE_DIRECTORY}
VOLUME ${SOURCE_DIRECTORY}
EXPOSE 4000
