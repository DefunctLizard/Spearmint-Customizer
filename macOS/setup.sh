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
sudo apt install snapd

# open dialog boxes
zenityPackageResult=$(
  zenity --list --checklist --title="Choose Packages to Install" --width="1000" --height="400" \
         --column="Select" --column="Package Name" --column="Description" \
         " " "gimp" "Known as GIMP, GNU Image Manipulation Program is a free and open source photo editor." \
         " " "neofetch" "A command-line system information tool." \
         " " "vlc-media-player" "VLC media player is a free and open-source, portable, cross-platform media player and streaming media server." \
         " " "vim-editor" "VIM is a free and open-source command-line text editor" \
         " " "inkscape" "Inkscape is a free and open-source vector graphics editor." \
)

# Wildcards (*) around the result will find matches.
if [[ $zenityPackageResult == *"gimp"* ]]; then
  sudo brew install gimp
fi

if [[ $zenityPackageResult == *"neofetch"* ]]; then
  sudo brew install neofetch
  echo "neofetch" >> ~/.bashrc
fi

if [[ $zenityPackageResult == *"vlc-media-player"* ]]; then
  sudo brew install vlc
fi

if [[ $zenityPackageResult == *"vim-editor"* ]]; then
  sudo brew install vim
fi

if [[ $zenityPackageResult == *"inkscape"* ]]; then
  sudo brew install inkscape
fi

