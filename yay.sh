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

yay -S --noconfirm --needed --sudoloop \
    papirus-maia-icon-theme-git \
    matcha-gtk-theme \
    soundux \
    plexamp-appimage \
    onedriver-git \
    archlinux-java-run \
    google-earth-pro 

# wine
yay -S --noconfirm --needed --sudoloop \
    dxvk-bin \
    protontricks \
    wine \
    winetricks

# Games
yay -S --noconfirm --needed --sudoloop \
    mangohud \
    lib32-mangohud \
    satisfactory-mod-manager \
    osu-lazer-bin \
    betacraft-launcher-bin \
    minecraft-technic-launcher \
    minecraft-launcher \
    nbtexplorer-bin \
    curseforge 

# zsh
yay -S --noconfirm --needed --sudoloop \
    zsh \
    zsh-autocomplete \
    zsh-autosuggestions \
    zsh-syntax-highlighting 

# Development
yay -S --noconfirm --needed --sudoloop \
    anaconda \
    android-studio \
    xilinx-ise \
    megit \
    netlogo 

# Creative
yay -S --noconfirm --needed --sudoloop \
    gimp-plugin-registry \
    cura-bin \
    drawio-desktop-bin \
    kdenlive 

# Browsers
yay -S --noconfirm --needed --sudoloop \
    microsoft-edge-stable-bin \
    chromium \
    firefox \
    tor 

# Tools
yay -S --noconfirm --needed --sudoloop \
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
    joplin-appimage \
    k4dirstat \
    teamviewer 
