#!/bin/bash

DISTRIBUTION=unknown

GNOME_VER=$( gnome-shell --version )

DISTRIBUTION=$( cat /etc/os-release )

LINUXorMAC=unknown

if [[ $DISTRIBUTION == "cat: /etc/os-release: No such file or directory" ]]; then
  read -p "Are you running macOS?" yn
  case $yn in
    [Yy]* ) cd /$HOME/spearmint-customizer/macOS; chmod +x setup.sh; ./setup.sh; break;;
    [Nn]* ) echo "could not detect OS, you might be able to run the setup file manually"; exit;;
    * ) echo "Please answer yes or no.";;
  esac
fi  
