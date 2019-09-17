# pull ubuntu image
FROM ubuntu:18.04

# make directory for game and logs
RUN mkdir game logs

ENV DEBIAN_FRONTEND=noninteractive \
    APPID=232250 \
    GAME_PATH=/game \
    STEAMCMD=/hlserver/steamcmd.sh

# install glibc & wget
RUN apt-get update && \
    apt-get install -y \ 
    libc6 \ 
    wget

# install other packages
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y \
    lib32z1 \
    libncurses5:i386 \
    libbz2-1.0:i386 \
    lib32gcc1 \
    lib32stdc++6 \
    libtinfo5:i386 \
    libcurl3-gnutls:i386

# create and change working directory to hlserver
RUN mkdir /hlserver

WORKDIR /hlserver

# get steamcmd_linux.tar.gz
RUN wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz && \
    tar zxf steamcmd_linux.tar.gz

# add the update script
ADD force_install.sh .

# make the update script executable
RUN chmod +x force_install.sh

VOLUME /game /logs
