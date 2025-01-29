#!/bin/bash

# Install yay if needed
if ! pacman -Qi yay > /dev/null ; then
    echo "Installing yay..."
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    cd /tmp/yay || exit 1
    makepkg -si || exit 1
    cd - || echo "failed to return to directory"
fi

# Install AUR packages

yay -Sy --noconfirm --needed --sudoloop \
    papirus-maia-icon-theme \
    matcha-gtk-theme \
    electron24-bin \
    soundux \
    plexamp-appimage \
    onedrivegui \
    archlinux-java-run \
    google-earth-pro \
    microsoft-edge-stable-bin 

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
    r2modman-bin \
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
    android-studio \
    xilinx-ise \
    megit \
    netlogo \
    lombok-eclipse-java \
    eclipse-java-bin 

# Creative
yay -S --noconfirm --needed --sudoloop \
    gimp-plugin-registry \
    cura-bin \
    kdenlive 

# Tools
yay -S --noconfirm --needed --sudoloop \
    spectre-meltdown-checker \
    gtkhash-thunar \
    freefilesync-bin \
    exif \
    balena-etcher \
    mission-center \
    makemkv \
    x2goclient \
    downgrade \
    joplin-appimage \
    qdirstat \
    teamviewer \
    chatbox-bin 
