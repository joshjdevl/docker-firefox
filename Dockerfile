FROM ubuntu:precise
MAINTAINER joshjdevl < joshjdevl [at] gmail {dot} com>

RUN apt-get update && apt-get -y install python-software-properties software-properties-common

RUN apt-get -y install wget
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN /usr/sbin/sshd
RUN echo "root:josh" | chpasswd

RUN add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) universe"
RUN add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) restricted"
RUN add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) multiverse"
RUN apt-get update
RUN apt-get install -y flashplugin-installer 
RUN apt-get install -y flashplugin-nonfree
RUN apt-get install -y firefox

RUN apt-get install -y chromium-browser
RUN useradd -m chromium -s "/bin/bash"
RUN echo "chromium:josh" | chpasswd

RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt-get install -y libcurl3
RUN dpkg -i google-chrome-stable_current_amd64.deb
RUN chmod u+s /opt
