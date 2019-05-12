#!/bin/bash

echo "starting Ubuntu 19.04 setup"

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

zenityThemeResult=$(
  zenity --list --title="Choose Themes to Install" --width="1000" --height="400" \
         --column="Package Name" --column="Description" \
         "spearmint-default" "The default theme uses arc-theme and has matte icons." \
         "macOS-dark" "This attempts to emulate the look and feel of macOSX mojave dark." \
         "macOS-light" "This attempts to emulate the look and feel of macOSX mojave light." \
         "qogir-win" "qogir is a blue theme with windows 10 like borders." \
         "materia" "The materia theme is a great material theme that incorporates the tela icon theme. " \
         "vimix" "Vimix is a macOS like theme with the zafiro icon theme." \
)

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
  gsettings set org.gnome.desktop.wm.preferences button-layout ':minimize,maximize,close'
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
  dconf reset -f /org/gnome/shell/extensions/dash-to-dock/
  gsettings set org.gnome.desktop.wm.preferences button-layout ':minimize,maximize,close'
  gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
  cd /$HOME/spearmint-customizer/qogir-GNOME/
  sudo cp lake_mountains_reflection_sky_116757_3840x2160.jpg /usr/share/backgrounds
  gsettings set org.gnome.desktop.background picture-uri file:///usr/share/backgrounds/lake_mountains_reflection_sky_116757_3840x2160.jpg
  sudo tar -xf Qogir.tar.xz
  sudo cp -r Qogir /usr/share/icons
  gsettings set org.gnome.desktop.interface icon-theme "Qogir"
fi

if [[ $zenityThemeResult == "materia" ]]; then
  sudo apt-get update
  sudo apt-get install materia-gtk-theme -yy
  gsettings set org.gnome.desktop.interface gtk-theme "Materia"
  git clone https://github.com/DefunctLizard/materia-GNOME.git
  cd /$HOME/spearmint-customizer/materia-GNOME/
  sudo tar -xf Tela-blue.tar.xz
  sudo cp -r Tela-blue /usr/share/icons
  gsettings set org.gnome.desktop.interface icon-theme "Tela-blue"
  dconf reset -f /org/gnome/shell/extensions/dash-to-dock/
  gsettings set org.gnome.desktop.wm.preferences button-layout ':minimize,maximize,close'
  gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
  gsettings set org.gnome.shell.extensions.dash-to-dock show-apps-at-top true
  sudo cp mountains_lake_clouds_117489_3840x2160.jpg /usr/share/backgrounds
  gsettings set org.gnome.desktop.background picture-uri file:///usr/share/backgrounds/mountains_lake_clouds_117489_3840x2160.jpg
fi

if [[ $zenityThemeResult == "vimix" ]]; then
  sudo apt-get update
  git clone https://github.com/DefunctLizard/Vimix-GNOME.git
  cd /$HOME/spearmint-customizer/Vimix-GNOME/
  sudo tar -xf vimix-color.tar.xz
  cd /$HOME/spearmint-customizer/Vimix-GNOME/vimix-color/
  sudo cp -r vimix /usr/share/themes
  cd /$HOME/spearmint-customizer/Vimix-GNOME/
  sudo tar -xf zafiro-icons-Classic-20190428004537.tar.xz
  sudo cp -r zafiro-icons-Classic /usr/share/icons
  gsettings set org.gnome.desktop.interface icon-theme "zafiro-icons-Classic"
  gsettings set org.gnome.desktop.interface gtk-theme "vimix"
  sudo cp mountain_peak_fog_132758_3840x2160.jpg /usr/share/backgrounds
  gsettings set org.gnome.desktop.background picture-uri file:///usr/share/backgrounds/mountain_peak_fog_132758_3840x2160.jpg
  dconf reset -f /org/gnome/shell/extensions/dash-to-dock/
  gsettings set org.gnome.desktop.wm.preferences button-layout ':minimize,maximize,close'
  gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
  gsettings set org.gnome.shell.extensions.dash-to-dock show-apps-at-top true
  sudo sed -i 's/background-color: #2C001E;/background-color: #232323;/g' /etc/alternatives/gdm3.css
fi
