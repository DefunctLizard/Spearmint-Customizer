#!/bin/bash
# Created By Grant Handy
# SPEARMINT CUSTOMIZER (UNINSTALLER)

# THIS SCRIPT IS INTENDED FOR GNOME VERSIONS 3.30 - 3.32

# remove background
sudo rm /usr/share/backgrounds/mountains_lake_tops_129263_3840x2160.jpg

# set background "wart-final-ubuntu.png"
gsettings set org.gnome.desktop.background picture-uri file:///usr/share/backgrounds/warty-final-ubuntu.png

# set dock settings
dconf reset -f /org/gnome/shell/extensions/dash-to-dock/

# uninstall git
sudo apt-get purge git

# uninstall xz-utils
sudo apt-get purge xz-utils

# uninstall gnome-shell-extensions
sudo apt-get purge gnome-shell-extensions

# uninstall gnome-tweaks
sudo apt-get purge gnome-tweaks

# uninstall arc-theme
sudo apt-get purge arc-theme

# delete Flat-Remix-Blue
rm -r Flat-Remix-Blue
