#!/bin/bash

DISTRIBUTION=unknown

GNOME_VER=$( gnome-shell --version )

DISTRIBUTION=$( cat /etc/os-release )

if [[ $GNOME_VER == *"GNOME"* ]]; then
  echo "GNOME is detected"
  if [[ $DISTRIBUTION == *"Ubuntu 19.04"* ]]; then
    cd /$HOME/spearmint-customizer/Ubuntu/19.04/
    chmod +x setup.sh
    ./setup.sh
  fi

  if [[ $DISTRIBUTION == *"Debian"* ]]; then
    cd /$HOME/spearmint-customizer/Debian/9/
    chmod +x setup.sh
    ./setup.sh
  fi

  if [[ $DISTRIBUTION == *"Ubuntu 18.04.2"* ]]; then
    cd /$HOME/spearmint-customizer/Ubuntu/18.04.2/
    chmod +x setup.sh
    ./setup.sh
  fi

else
  echo "GNOME was not detected"
  while true; do
      read -p "Are you running Linux? (y or n)" yn
      case $yn in
          [Yy]* ) LINUX=y; break;;
          [Nn]* ) LINUX=n; break;;
          * ) echo "Please answer yes or no.";;
      esac
  done

  if [[ $LINUX == "n" ]]; then
    while true; do
        read -p "Are you running macOS? (y or n)" yn
        case $yn in
            [Yy]* ) cd /$HOME/spearmint-customizer/macOS; chmod +x setup.sh; ./setup.sh; break;;
            [Nn]* ) echo "could not detect OS"; exit;;
            * ) echo "Please answer y or n.";;
        esac
    done
  fi

  if [[ $LINUX == "y" ]]; then
    while true; do
        read -p "Are you running Debian based or Ubuntu based? (d or u)" yn
        case $yn in
            [Dd]* ) DEBIAN=y; break;;
            [Uu]* ) UBUNTU=y; break;;
            * ) echo "Please answer d or u.";;
        esac
    done
  fi

  if [[ $DEBIAN == "y" ]]; then
    echo "Debian gnomeless setup"
    cd /$HOME/spearmint-customizer/Debian/gnomeless/
    chmod +x setup.sh
    ./setup.sh
  fi

  if [[ $UBUNTU == "y" ]]; then
    echo "Ubuntu gnomeless setup"
    cd /$HOME/spearmint-customizer/Ubuntu/gnomeless/
    chmod +x setup.sh
    ./setup.sh
  fi
fi
