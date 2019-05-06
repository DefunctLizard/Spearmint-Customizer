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

# open dialog boxes
zenityResult=$(
  zenity --list --checklist --title="Choose Packages to Install" --width="1000" --height="400" \
         --column="Select" --column="Package Name" --column="Description" \
         " " gimp "Known as GIMP, GNU Image Manipulation Program is a free and open source photo editor." \
         " " neofetch "A command-line system information tool." \
         " " caffeine "A status bar application able to temporarily prevent the activation of both the screensaver and the sleep powersaving mode." \
         " " bleachbit "BleachBit is a free and open-source disk space cleaner, privacy manager, and computer system optimizer." \
         " " vlc-media-player "VLC media player is a free and open-source, portable, cross-platform media player and streaming media server." \
         " " vim-editor "VIM is a free and open-source command-line text editor" \
         " " inkscape "Inkscape is a free and open-source vector graphics editor." \
         " " atom "Atom is a free and open-source text editor which can also be used as an IDE." \

)

zenity --question --width="500" --text="Are you sure you wish to install these packages: $zenityResult"
confirmCode=$?

if [ "$confirmCode" -ne 0 ]; then
  echo "Cancelled. Thank you."
  exit 1
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

if [[ $zenityResult == *"atom"* ]]; then
   sudo add-apt-repository ppa:webupd8team/atom
   sudo apt-get update
   sudo apt-get install atom
fi

#if [[ $zenityResult == *"template"* ]]; then
#  *insert install here*
#fi

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
