#!/bin/bash
   #################################################################
   #                                                               #
   #                 Spearmint Customizer                          #
   #                Created By Grant Handy                         #
   #       Licensed under the GNU General Public License 3.0       #
   #                grantshandy@gmail.com                          #
   #     https://github.com/DefunctLizard/spearmint-customizer     #
   #                                                               #
   #################################################################

# update packages
sudo apt-get update

# remove background
sudo rm /usr/share/backgrounds/mountains_lake_tops_129263_3840x2160.jpg

# set background "wart-final-ubuntu.png"
gsettings set org.gnome.desktop.background picture-uri file:///usr/share/backgrounds/warty-final-ubuntu.png

# set dock settings
dconf reset -f /org/gnome/shell/extensions/dash-to-dock/

# set theme Yaru
gsettings set org.gnome.desktop.interface gtk-theme "Yaru"

# set icon theme
gsettings set org.gnome.desktop.interface icon-theme "Yaru"

# uninstall arc-theme
sudo apt-get purge arc-theme

# delete Flat-Remix-Blue
rm -r Flat-Remix-Blue
