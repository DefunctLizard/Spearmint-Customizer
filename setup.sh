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
zenityPackageResult=$(
  zenity --list --checklist --title="Choose Packages to Install" --width="1000" --height="400" \
         --column="Select" --column="Package Name" --column="Description" \
         " " gimp "Known as GIMP, GNU Image Manipulation Program is a free and open source photo editor." \
         " " neofetch "A command-line system information tool." \
         " " caffeine "A status bar application able to temporarily prevent the activation of both the screensaver and the sleep powersaving mode." \
         " " bleachbit "BleachBit is a free and open-source disk space cleaner, privacy manager, and computer system optimizer." \
         " " vlc-media-player "VLC media player is a free and open-source, portable, cross-platform media player and streaming media server." \
         " " vim-editor "VIM is a free and open-source command-line text editor" \
         " " inkscape "Inkscape is a free and open-source vector graphics editor." \
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

zenityThemeResult=$(
  zenity --list --checklist --title="Choose Packages to Install" --width="1000" --height="400" \
         --column="Select" --column="Package Name" --column="Description" \
         " " "default-theme" "Known as GIMP, GNU Image Manipulation Program is a free and open source photo editor." \
)

if [[ $zenityThemeResult == *"default-theme"* ]]; then
  sudo apt install arc-theme -yy
  gsettings set org.gnome.desktop.interface gtk-theme "Arc-Darker"
  git clone https://github.com/DefunctLizard/spearmint-themes/
  cd /$HOME/spearmint-customizer/spearmint-themes/backgrounds/
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

zenity --question --text="Are you sure you wish to install these packages: $zenityPackageResult $zenityThemeResult"
confirmCode=$?

if [ "$confirmCode" -ne 0 ]; then
  echo "Cancelled. Thank you."
  exit 1
fi
