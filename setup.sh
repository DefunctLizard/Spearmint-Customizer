#!/bin/bash
# Created By Grant Handy
# SPEARMINT CUSTOMIZER

# THIS SCRIPT IS INTENDED FOR GNOME VERSIONS 3.30 - 3.32!

# Install arc-theme
sudo apt install arc-theme
# move background to /usr/share/backgrounds
sudo cp mountains_lake_tops_129263_3840x2160.jpg /usr/share/backgrounds
# set background "mountains_lake_tops_129263_3840x2160.jpg"
gsettings set org.gnome.desktop.background picture-uri file:///usr/share/backgrounds/mountains_lake_tops_129263_3840x2160.jpg

