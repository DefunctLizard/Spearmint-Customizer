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
sudo apt-get install xz-utils -yy
sudo apt-get install zenity -yy
sudo apt-get install gnome-tweaks -yy
sudo apt install git -yy

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
  zenity --list --title="Choose Packages to Install" --width="1000" --height="400" \
         --column="Package Name" --column="Description" \
         "spearmint-default" "The default theme uses arc-theme and has matte icons." \
         "macOS-dark" "This attempts to emulate the look and feel of macOSX mojave dark." \
         "macOS-light" "This attempts to emulate the look and feel of macOSX mojave light." \
         "qogir-win" "qogir is a blue theme with windows 10 like borders." \
)

zenity --question --text="Are you sure you wish to install these packages: $zenityPackageResult $zenityThemeResult"
confirmCode=$?

if [ "$confirmCode" -ne 0 ]; then
  echo "Cancelled. Thank you."
  exit 1
fi

if [[ $zenityThemeResult == "spearmint-default" ]]; then
  sudo apt-get update
  sudo git clone https://github.com/DefunctLizard/spearmint-default-GNOME.git
  sudo apt install arc-theme -yy
  gsettings set org.gnome.desktop.interface gtk-theme "Arc-Darker"
  gsettings set org.gnome.shell.extensions.dash-to-dock show-apps-at-top true
  gsettings set org.gnome.shell.extensions.dash-to-dock running-indicator-style DEFAULT
  gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-customize-running-dots false
  gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-shrink false
  gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode DEFAULT
  gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
  gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
  cd /$HOME/spearmint-customizer/spearmint-default-GNOME/
  sudo cp mountains_lake_tops_129263_3840x2160.jpg /usr/share/backgrounds
  gsettings set org.gnome.desktop.background picture-uri file:///usr/share/backgrounds/mountains_lake_tops_129263_3840x2160.jpg
  sudo tar -xf Flat-Remix-Blue_1.90.tar.xz
  sudo cp -r Flat-Remix-Blue /usr/share/icons
  gsettings set org.gnome.desktop.interface icon-theme "Flat-Remix-Blue"
fi

if [[ $zenityThemeResult == "macOS-dark" ]]; then
  sudo apt-get update
  git clone https://github.com/DefunctLizard/macOS-GNOME.git
  cd /$HOME/spearmint-customizer/macOS-GNOME
  mkdir OSX_ONE
  sudo tar -xf OSX_ONE9.2.tar.xz --directory /$HOME/spearmint-customizer/macOS-GNOME/OSX_ONE
  cd /$HOME/spearmint-customizer/macOS-GNOME/OSX_ONE
  sudo cp -r OSX_ONE /usr/share/icons
  gsettings set org.gnome.desktop.interface icon-theme "OSX_ONE"
  cd /$HOME/spearmint-customizer/macOS-GNOME/
  sudo cp mojave-night.jpg /usr/share/backgrounds
  sudo tar -xf Mojave-dark.tar.xz
  sudo cp -r Mojave-dark /usr/share/themes/
  gsettings set org.gnome.desktop.interface gtk-theme "Mojave-dark"
  gsettings set org.gnome.desktop.background picture-uri file:///usr/share/backgrounds/mojave-night.jpg
  gsettings set org.gnome.shell.extensions.dash-to-dock show-apps-at-top true
  gsettings set org.gnome.shell.extensions.dash-to-dock running-indicator-style DEFAULT
  gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-customize-running-dots false
  gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-shrink false
  gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode DEFAULT
  gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
  gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
  gsettings set org.gnome.desktop.wm.preferences button-layout 'close,maximize,minimize:'
fi

if [[ $zenityThemeResult == "macOS-light" ]]; then
  sudo apt-get update
  git clone https://github.com/DefunctLizard/macOS-light-GNOME.git
  cd /$HOME/spearmint-customizer/macOS-light-GNOME/
  mkdir OSX_ONE
  sudo tar -xf OSX_ONE9.2.tar.xz --directory /$HOME/spearmint-customizer/macOS-light-GNOME/OSX_ONE
  cd /$HOME/spearmint-customizer/macOS-light-GNOME/OSX_ONE
  sudo cp -r OSX_ONE /usr/share/icons
  gsettings set org.gnome.desktop.interface icon-theme "OSX_ONE"
  cd /$HOME/spearmint-customizer/macOS-light-GNOME/
  sudo cp mojave-day.jpg /usr/share/backgrounds
  sudo tar -xf Mojave-light.tar.xz
  sudo cp -r Mojave-light /usr/share/themes/
  gsettings set org.gnome.desktop.interface gtk-theme "Mojave-light"
  gsettings set org.gnome.desktop.background picture-uri file:///usr/share/backgrounds/mojave-day.jpg
  gsettings set org.gnome.shell.extensions.dash-to-dock show-apps-at-top true
  gsettings set org.gnome.shell.extensions.dash-to-dock running-indicator-style DEFAULT
  gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-customize-running-dots false
  gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-shrink false
  gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode DEFAULT
  gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
  gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
  gsettings set org.gnome.desktop.wm.preferences button-layout 'close,maximize,minimize:'
fi

if [[ $zenityThemeResult == "qogir-win" ]]; then
  sudo apt-get update
  sudo git clone https://github.com/DefunctLizard/qogir-GNOME.git
  cd /$HOME/spearmint-customizer/qogir-GNOME/
  sudo tar -xf Qogir-win.tar.xz
  sudo cp -r Qogir-win /usr/share/themes
  gsettings set org.gnome.desktop.interface gtk-theme "Qogir-win"
  gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
  cd /$HOME/spearmint-customizer/qogir-GNOME/
  sudo cp lake_mountains_reflection_sky_116757_3840x2160.jpg /usr/share/backgrounds
  gsettings set org.gnome.desktop.background picture-uri file:///usr/share/backgrounds/lake_mountains_reflection_sky_116757_3840x2160.jpg
  sudo tar -xf Qogir.tar.xz
  sudo cp -r Qogir /usr/share/icons
  gsettings set org.gnome.desktop.interface icon-theme "Qogir"
fi
