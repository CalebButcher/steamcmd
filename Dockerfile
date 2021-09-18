FROM ubuntu:focal

RUN dpkg --add-architecture i386 && \
    apt-get update &&  \
    apt-get install -y software-properties-common && \
    add-apt-repository multiverse && \
    apt-get update &&  \
    echo steam steam/question select "I AGREE" | debconf-set-selections && \
    echo steam steam/license note '' | debconf-set-selections && \
    apt-get install -y ca-certificates steamcmd language-pack-en && \
    rm -rf /var/lib/apt/lists/*

RUN ln -s /usr/games/steamcmd /usr/local/bin
RUN adduser --gecos "" --disabled-password steam

WORKDIR /home/steam
USER steam

RUN steamcmd +quit