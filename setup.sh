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

# open dialog box for package manager
zenityResult=$(
  zenity --list --checklist --title="Choose Packages to Install" --width="1000" --height="400" \
         --column="Select" --column="Package Name" --column="Description" \
         " " gimp "Known as GIMP, GNU Image Manipulation Program is a free and open source photo editor." \
         " " neofetch "A command-line system information tool." \
         " " caffeine "A status bar application able to temporarily prevent the activation of both the screensaver and the sleep powersaving mode." \
         " " bleachbit "BleachBit is a free and open-source disk space cleaner, privacy manager, and computer system optimizer." \
         " " vlc-media-player "VLC media player is a free and open-source, portable, cross-platformsudo apt-get install atom media player and streaming media server." \
         " " vim-editor "VIM is a free and open-source command-line text editor" \
         " " inkscape "Inkscape is a free and open-source vector graphics editor." \
)

if [[ $zenityResult == " " ]]; then
" "
else
  zenity --question --width="500" --text="Are you sure you wish to install these packages: $zenityResult"
  confirmCode=$?

  if [ "$confirmCode" -ne 0 ]; then
    echo "Cancelled. Thank you."
  fi

# Wildcards (*) around the result will find matches.
if [[ $zenityResult == *"gimp"* ]]; then
  sudo apt-get install gimp -yy
fi

if [[ $zenityResult == *"neofetch"* ]]; then
  sudo apt install neofetch -yy
  echo "neofetch" >> ~/.bashrc
fi

if [[ $zenityResult == *"caffeine"* ]]; then
  sudo apt-get install caffeine -yy
fi

if [[ $zenityResult == *"bleachbit"* ]]; then
  sudo apt-get install bleachbit -yy
fi

if [[ $zenityResult == *"vlc-media-player"* ]]; then
  sudo apt-get install vlc -yy
fi

if [[ $zenityResult == *"vim-editor"* ]]; then
  sudo apt-get install vim -yy
fi

if [[ $zenityResult == *"inkscape"* ]]; then
  sudo apt-get install inkscape -yy
fi
