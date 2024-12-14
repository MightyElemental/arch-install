#!/bin/bash

pacman -Sy --noconfirm

# Basic Tools
pacman -S --noconfirm --needed \
    gparted \
    base-devel \
    git \
    sudo \
    wget \
    curl \
    ibus \
    ibus-anthy \
    ffmpeg \
    jq \
    xclip 

# Standard
pacman -S --noconfirm --needed \
    breeze-gtk \
    noto-fonts-emoji \
    thunderbird \
    alltray \
    catfish \
    virtualbox \
    virtualbox-guest-iso \
    virtualbox-guest-utils \
    discord \
    telegram-desktop \
    obs-studio \
    v4l2loopback-dkms \
    libreoffice-still \
    gnome-disk-utility \
    gsmartcontrol \
    drawio-desktop \
    qbittorrent \
    steam \
    steam-native-runtime \
    vlc \
    dolphin-emu

# Development
pacman -S --noconfirm --needed \
    cuda \
    cuda-tools \
    audacity \
    gimp \
    code \
    cmake \
    openmpi \
    dbeaver \
    sqlitebrowser \
    wireshark-qt \
    filezilla \
    blender \
    texlive-latexextra \
    biber \
    texstudio \
    jdk-openjdk \
    openjdk-doc \
    openjdk-src \
    jdk17-openjdk \
    openjdk17-doc \
    openjdk17-src \
    jdk11-openjdk \
    openjdk11-doc \
    openjdk11-src \
    jdk8-openjdk \
    openjdk8-doc \
    openjdk8-src \
    ghc-libs \
    ghc \
    haskell-random 
