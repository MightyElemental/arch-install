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
    jq \
    xclip 

# Standard
pacman -S --noconfirm --needed \
    breeze-gtk \
    noto-fonts-emoji \
    thunderbird \
    catfish \
    virtualbox \
    virtualbox-guest-iso \
    virtualbox-guest-utils \
    discord \
    telegram-desktop \
    obs-studio 

# Entertainment
pacman -S --noconfirm --needed \
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
    blender 

# Latex
pacman -S --noconfirm --needed \
    texlive-latexextra \
    biber \
    texstudio 

# Java
pacman -S --noconfirm --needed \
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
    openjdk8-src 

