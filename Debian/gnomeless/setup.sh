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
sudo apt-get install zenity -yy
sudo apt install git -yy
sudo apt install snapd

# open dialog boxes
zenityPackageResult=$(
  zenity --list --checklist --title="Choose Packages to Install" --width="1000" --height="400" \
         --column="Select" --column="Package Name" --column="Description" \
         " " "gimp" "Known as GIMP, GNU Image Manipulation Program is a free and open source photo editor." \
         " " "neofetch" "A command-line system information tool." \
         " " "caffeine" "A status bar application able to temporarily prevent the activation of both the screensaver and the sleep powersaving mode." \
         " " "bleachbit" "BleachBit is a free and open-source disk space cleaner, privacy manager, and computer system optimizer." \
         " " "vlc-media-player" "VLC media player is a free and open-source, portable, cross-platform media player and streaming media server." \
         " " "vim-editor" "VIM is a free and open-source command-line text editor" \
         " " "inkscape" "Inkscape is a free and open-source vector graphics editor." \
         " " "chromium" "Chromium is Google's open-source web browser project." \
         " " "atom" "Atom is a text editor developed by GitHub." \
)

# Wildcards (*) around the result will find matches.
if [[ $zenityPackageResult == *"gimp"* ]]; then
  sudo apt-get install gimp -yy
fi

if [[ $zenityPackageResult == *"neofetch"* ]]; then
  sudo apt install neofetch -yy
  echo "neofetch" >> ~/.bashrc
fi

if [[ $zenityPackageResult == *"caffeine"* ]]; then
  sudo apt-get install caffeine -yy
fi

if [[ $zenityPackageResult == *"bleachbit"* ]]; then
  sudo apt-get install bleachbit -yy
fi

if [[ $zenityPackageResult == *"vlc-media-player"* ]]; then
  sudo apt-get install vlc -yy
fi

if [[ $zenityPackageResult == *"vim-editor"* ]]; then
  sudo apt-get install vim -yy
fi

if [[ $zenityPackageResult == *"inkscape"* ]]; then
  sudo apt-get install inkscape -yy
fi

if [[ $zenityPackageResult == *"chromium"* ]]; then
  sudo apt install -y chromium-browser -yy
fi

if [[ $zenityPackageResult == *"atom"* ]]; then
  sudo snap install atom --classic
fi
