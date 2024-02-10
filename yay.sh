#!/bin/bash

# Install yay if needed
if ! pacman -Qi yay > /dev/null ; then
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd ..
    rm -r yay
fi

# Install AUR packages

yay -S --noconfirm --needed \
    papirus-maia-icon-theme-git \
    matcha-gtk-theme \
    soundux \
    plexamp-appimage \
    onedriver-git \
    archlinux-java-run 

# Games
yay -S --noconfirm --needed \
    mangohud-common-git \
    osu-lazer-bin \
    betacraft-launcher-bin \
    minecraft-technic-launcher \
    minecraft-launcher \
    nbtexplorer-bin 

# Development
yay -S --noconfirm --needed \
    anaconda \
    android-studio \
    xilinx-ise \
    megit \
    net-logo 

# Creative
yay -S --noconfirm --needed \
    gimp-plugin-registry \
    cura-modern-appimage \
    drawio-desktop-bin 

# Tools
yay -S --noconfirm --needed \
    spectre-meltdown-checker \
    gtkhash-thunar \
    qbittorrent \
    freefilesync-bin \
    exif \
    balena-etcher-appimage \
    mission-center-git \
    makemkv \
    x2goclient \
    downgrade \
    yt-dlp-git \
    joplin-appimage \
    k4dirstat \
