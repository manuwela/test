FROM ubuntu:trusty
MAINTAINER Manuwela Kanade

RUN apt-get update && \
    apt-get install -y nginx && \
