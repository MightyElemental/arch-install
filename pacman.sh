#!/bin/bash

pacman -Sy --noconfirm

# Basic Tools
pacman -S --noconfirm --needed \
    gparted \
    base-devel \
    git \
    sudo \
    wget \
    curl 

# Standard
pacman -S --noconfirm --needed \
    breeze-gtk \
    firefox \
    thunderbird \
    catfish \
    virtualbox \
    virtualbox-guest-iso \
    virtualbox-guest-utils

# Entertainment
pacman -S --noconfirm --needed \
    steam \
    vlc \
    dolphin-emu

# Development
pacman -S --noconfirm --needed \
    cuda \
    cuda-tools \
    audacity \
    gimp \
    code \
    openmpi \
    dbeaver \
    sqlitebrowser 

# Latex
pacman -S --noconfirm --needed \
    texlive \
    biber \
    texstudio 

# Java
pacman -S --noconfirm --needed \
    jdk17-openjdk \
    openjdk17-doc \
    openjdk17-src \
    jdk11-openjdk \
    openjdk11-doc \
    openjdk11-src \
    jdk8-openjdk \
    openjdk8-doc \
    openjdk8-src \
    eclipse-java

