#!/bin/bash
   #################################################################
   #                                                               #
   #                 Spearmint Customizer              		       #
   #                Created By Grant Handy                         #
   #       Licensed under the GNU General Public License 3.0       #
   #                                                               #
   #     https://github.com/DefunctLizard/spearmint-customizer     #
   #                                                               #
   #################################################################

# update packages
sudo apt-get update

# install vim
sudo apt install vim

# install git
sudo apt-get install git

# install neofetch and edit .bashrc
sudo apt install neofetch
echo "neofetch'" >> ~/.bashrc

# install xz-utils
sudo apt-get install xz-utils

# install gnome-tweaks
sudo apt install gnome-tweak-tool

# install gnome shell extensions
sudo apt-get install gnome-shell-extensions 

# install arc-theme
sudo apt install arc-theme

# switch to arc-darker
gsettings set org.gnome.desktop.interface gtk-theme "Arc-Darker"

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

# open the flat-remix-blue icons
sudo tar -xf Flat-Remix-Blue_1.90.tar.xz

# copy flat-remix-blue icons
sudo cp -r Flat-Remix-Blue /usr/share/icons

# set icon theme
gsettings set org.gnome.desktop.interface icon-theme "Flat-Remix-Blue"
