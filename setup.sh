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
         " " vlc-media-player "VLC media player is a free and open-source, portable, cross-platformsudo apt-get install atom media player and streaming media server." \
         " " vim-editor "VIM is a free and open-source command-line text editor" \
         " " inkscape "Inkscape is a free and open-source vector graphics editor." \
)

if [[ $zenityResult == " " ]]; then

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

sudo apt-get install gnome-tweaks

themeResult=$(
  zenity --list --checklist --title="Choose Themes to Install" --width="1000" --height="400" \
         --column="Select" --column="Package Name" --column="Description" \
         " " spearmint "This is the default theme for spearmint customizer." \
)

zenity --question --width="500" --text="Are you sure you wish to install these packages: $zenityResult"
confirmCode=$?

if [ "$confirmCode" -ne 0 ]; then
  echo "Cancelled. Thank you."
  exit 1
fi

if [[ $themeResult == *"spearmint"* ]]; then
  sudo apt-get install arc-theme
  gsettings set org.gnome.desktop.interface gtk-theme "Arc-Darker"
  sudo cp mountains_lake_tops_129263_3840x2160.jpg /usr/share/backgrounds
  gsettings set org.gnome.desktop.background picture-uri file:///usr/share/backgrounds/mountains_lake_tops_129263_3840x2160.jpg
  gsettings set org.gnome.shell.extensions.dash-to-dock show-apps-at-top true
  gsettings set org.gnome.shell.extensions.dash-to-dock running-indicator-style DEFAULT
  gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-customize-running-dots false
  gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-shrink false
  gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode DEFAULT
  gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
  gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
  sudo tar -xf Flat-Remix-Blue_1.90.tar.xz
  sudo cp -r Flat-Remix-Blue /usr/share/icons
  gsettings set org.gnome.desktop.interface icon-theme "Flat-Remix-Blue"
fi
