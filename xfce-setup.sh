#!/bin/bash

# Themes
xfconf-query -c xsettings -p /Net/IconThemeName -t "string" -s "Papirus-Dark-Maia" -n
xfconf-query -c xsettings -p /Net/ThemeName -t "string" -s "Matcha-dark-azul" -n

# Shortcuts
xfconf-query -c xfce4-keyboard-shortcuts -p "/commands/custom/<Shift><Super>s" -t "string" -s "xfce4-screenshooter -rc" -n # Screenshot
xfconf-query -c xfce4-keyboard-shortcuts -p "/commands/custom/<Primary><Alt>t" -t "string" -s "xfce4-terminal" -n # Terminal