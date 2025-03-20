FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Berlin

RUN apt update --allow-releaseinfo-change -y && \
    apt install -y \
    apt-utils \
    build-essential \
    curl \
    git \
    gnome-software \
    gnome-software-plugin-snap \
    snapd \
    ubuntu-desktop \
    sudo \
    && \
    apt autoremove -y && \
    apt clean

RUN useradd -m -s /bin/bash -u 1000 kasm-user
RUN usermod -aG sudo kasm-user
RUN echo "kasm-user ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER 1000

# Arbeitsverzeichnis setzen
WORKDIR /home/kasm-user

# Befehl zum Starten des Desktops
CMD ["startx"]
