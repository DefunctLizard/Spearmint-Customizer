#!/bin/bash
   #################################################################
   #                                                               #
   #                 Spearmint Customizer                          #
   #                Created By Grant Handy                         #
   #       Licensed under the GNU General Public License 3.0       #
   #                                                               #
   #     https://github.com/DefunctLizard/spearmint-customizer     #
   #                                                               #
   #################################################################

# update packages
sudo apt-get update

# install various programs
sudo apt install neofetch
sudo apt-get install xz-utils
sudo apt install gnome-tweak-tool
sudo apt-get install gnome-shell-extensions 
sudo apt-get install bleachbit
sudo apt-get install VLC
sudo apt install arc-theme
sudo apt-get install git
sudo apt install vim
sudo apt-get install gimp
sudo apt-get install inkscape
sudo apt-get install caffeine

# Edit .bashrc for neofetch
echo "neofetch" >> ~/.bashrc

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
