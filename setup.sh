#!/bin/bash
# Created By Grant Handy
# SPEARMINT CUSTOMIZER

# THIS SCRIPT IS INTENDED FOR GNOME VERSIONS 3.30 - 3.32!

# install git
sudo apt-get install git

# install gnome-tweaks
sudo apt-get install gnome-tweak-tool

#install gnome-shell-extensions
sudo apt install gnome-shell-extensions

# install arc-theme
sudo apt install arc-theme

# move background to /usr/share/backgrounds
sudo cp mountains_lake_tops_129263_3840x2160.jpg /usr/share/backgrounds

# set background "mountains_lake_tops_129263_3840x2160.jpg"
gsettings set org.gnome.desktop.background picture-uri file:///usr/share/backgrounds/mountains_lake_tops_129263_3840x2160.jpg

# set dock settings
gsettings set org.gnome.shell.extensions.dash-to-dock show-apps-at-top true
gsettings set org.gnome.shell.extensions.dash-to-dock running-indicator-style DEFAULT
gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-customize-running-dots false
gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-shrink false
gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode DEFAULT
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM

# install dash to dock
git clone https://github.com/micheleg/dash-to-dock.git
