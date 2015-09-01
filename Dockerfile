FROM ubuntu:latest


RUN apt-get update
RUN apt-get install openssh-server

RUN mkdir /var/run/sshd

RUN apt-get install openjdk-6-jdk

RUN /usr/sbin/sshd

