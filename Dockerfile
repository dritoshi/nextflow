FROM ubuntu:14.04
MAINTAINER Itoshi NIKAIDO "dritoshi@gmail.com"

RUN locale-gen en_US.UTF-8
RUN update-locale LANG=en_US.UTF-8
ENV LC_ALL C
ENV LC_ALL en_US.UTF-8

# apt-get
ENV DEBIAN_FRONTEND noninteractive
RUN echo "deb http://jp.archive.ubuntu.com/ubuntu/ trusty main restricted\n\
deb-src http://jp.archive.ubuntu.com/ubuntu/ trusty main restricted\n\
deb http://jp.archive.ubuntu.com/ubuntu/ trusty-updates main restricted\n\
deb-src http://jp.archive.ubuntu.com/ubuntu/ trusty-updates main restricted\n\
deb http://jp.archive.ubuntu.com/ubuntu/ trusty universe\n\
deb-src http://jp.archive.ubuntu.com/ubuntu/ trusty universe\n\
deb http://jp.archive.ubuntu.com/ubuntu/ trusty-updates universe\n\
deb-src http://jp.archive.ubuntu.com/ubuntu/ trusty-updates universe\n\
deb http://jp.archive.ubuntu.com/ubuntu/ trusty multiverse\n\
deb-src http://jp.archive.ubuntu.com/ubuntu/ trusty multiverse\n\
deb http://jp.archive.ubuntu.com/ubuntu/ trusty-updates multiverse\n\
deb-src http://jp.archive.ubuntu.com/ubuntu/ trusty-updates multiverse\n\
deb http://jp.archive.ubuntu.com/ubuntu/ trusty-backports main restricted universe multiverse\n\
deb-src http://jp.archive.ubuntu.com/ubuntu/ trusty-backports main restricted universe multiverse\n\
deb http://security.ubuntu.com/ubuntu trusty-security main restricted\n\
deb-src http://security.ubuntu.com/ubuntu trusty-security main restricted\n\
deb http://security.ubuntu.com/ubuntu trusty-security universe\n\
deb-src http://security.ubuntu.com/ubuntu trusty-security universe\n\
deb http://security.ubuntu.com/ubuntu trusty-security multiverse\n\
deb-src http://security.ubuntu.com/ubuntu trusty-security multiverse\n"> /etc/apt/sources.list

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y software-properties-common

# Java
RUN add-apt-repository ppa:webupd8team/java
RUN apt-get update
RUN apt-get upgrade -y
RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get install -y oracle-java7-installer oracle-java7-set-default
# ENV JAVA_HOME /usr/lib/jvm/java-7-oracle
# ENV JAVA_CMD java

# SSH
RUN apt-get install -y ssh
RUN mkdir /var/run/sshd
RUN echo 'root:screencast' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

RUN apt-get clean

# nextflow
RUN apt-get install -y curl
RUN echo $JAVA_HOME
RUN echo $JAVA_CMD
RUN ls -R /usr/lib/jvm
RUN curl -fsSL get.nextflow.io | bash
ADD tutorial.nf /
