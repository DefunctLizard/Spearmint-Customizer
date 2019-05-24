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

# update packages and install essentials
sudo apt-get update -yy
sudo apt update -yy
sudo apt-get install xz-utils -yy
sudo apt-get install zenity -yy
sudo apt-get install gnome-tweaks -yy
sudo apt install git -yy

# open dialog boxes
zenityPackageResult=$(
  zenity --list --checklist --title="Choose Packages to uninstall" --width="1000" --height="400" \
         --column="Select" --column="Package Name" --column="Description" \
         " " "gimp" "Known as GIMP, GNU Image Manipulation Program is a free and open source photo editor." \
         " " "neofetch" "A command-line system information tool." \
         " " "caffeine" "A status bar application able to temporarily prevent the activation of both the screensaver and the sleep powersaving mode." \
         " " "bleachbit" "BleachBit is a free and open-source disk space cleaner, privacy manager, and computer system optimizer." \
         " " "vlc-media-player" "VLC media player is a free and open-source, portable, cross-platform media player and streaming media server." \
         " " "vim-editor" "VIM is a free and open-source command-line text editor" \
         " " "inkscape" "Inkscape is a free and open-source vector graphics editor." \
         " " "chromium" "Chromium is Google's open-source web browser project." \
)

# Wildcards (*) around the result will find matches.
if [[ $zenityPackageResult == *"gimp"* ]]; then
  sudo apt-get purge gimp -yy
fi

if [[ $zenityPackageResult == *"neofetch"* ]]; then
  sudo apt purge neofetch -yy
  sed -i '104d' ~/.bashrc
fi

if [[ $zenityPackageResult == *"caffeine"* ]]; then
  sudo apt-get purge caffeine -yy
fi

if [[ $zenityPackageResult == *"bleachbit"* ]]; then
  sudo apt-get purge bleachbit -yy
fi

if [[ $zenityPackageResult == *"vlc-media-player"* ]]; then
  sudo apt-get purge vlc -yy
fi

if [[ $zenityPackageResult == *"vim-editor"* ]]; then
  sudo apt-get purge vim -yy
fi

if [[ $zenityPackageResult == *"inkscape"* ]]; then
  sudo apt-get purge inkscape -yy
fi

if [[ $zenityPackageResult == *"chromium"* ]]; then
  sudo apt purge chromium-browser -yy
fi
