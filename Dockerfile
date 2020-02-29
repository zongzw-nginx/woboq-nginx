# build with
#   docker build . -t zongzw/woboq-nginx-image:latest

FROM ubuntu:latest

RUN apt-get update -y
RUN apt-get install -y wget vim tree nginx bear clang libpcre3-dev zlib1g-dev make

workdir /root
RUN wget https://download.opensuse.org/repositories/home:/pansenmann:/woboq/xUbuntu_16.10/amd64/woboq-codebrowser_2.1_amd64.deb
RUN dpkg -i woboq-codebrowser_2.1_amd64.deb
RUN rm -f woboq-codebrowser_2.1_amd64.deb

