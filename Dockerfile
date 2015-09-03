FROM ubuntu:latest


RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y openssh-server

RUN sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd
RUN mkdir -p /var/run/sshd

# Install JDK 7 (latest edition)
RUN apt-get install -y openjdk-7-jdk

# Standard SSH port
EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]

RUN sudo apt-get install wget
RUN wget -qO- https://get.docker.com/ | sh
RUN docker run -d -p 5000:5000 --restart=always --name registry registry:2
RUN git clone https://github.com/mkanade/test
RUN cd test
RUN docker build -t manuwela/test .
RUN docker tag manuwela/test localhost:5000/test
RUN docker push localhost:5000/test

