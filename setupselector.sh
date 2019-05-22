#!/bin/bash

DISTRIBUTION=unknown

zenitydistroResult=unknown

GNOME_VER=$(gnome-shell --version)

DISTRIBUTION=$( cat /etc/os-release )

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

if [[ $DISTRIBUTION == *"Debian"* ]]; then
  cd /$HOME/spearmint-customizer/Debian/9/
  chmod +x setup.sh
  ./setup.sh
fi

if [[ $GNOME_VER == *"GNOME"* ]]; then
  echo "GNOME is detected"
else
  cd /$HOME/spearmint-customizer/Debian/Raspberry_Pi/
  chmod +x setup.sh
  ./setup.sh
fi
