#!/bin/bash

# Themes
xfconf-query -c xsettings -p /Net/IconThemeName -s "Papirus-Dark"
xfconf-query -c xsettings -p /Net/ThemeName -s "Matcha-dark-azul"

# Shortcuts
xfconf-query -c xfce4-keyboard-shortcuts -p "/commands/custom/<Shift><Super>s" -t "string" -s "xfce4-screenshooter -r" -n # Screenshot
xfconf-query -c xfce4-keyboard-shortcuts -p "/commands/custom/<Primary><Alt>t" -t "string" -s "xfce4-terminal" -n # Terminal