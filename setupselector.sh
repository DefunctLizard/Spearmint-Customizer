#!/bin/bash

DISTRIBUTION=unknown

zenitydistroResult=unknown

GNOME_VER=unknown

GNOME_VER=$( gnome-session --version )

if [[ $GNOME_VER == *"gnome-session"* ]]; then
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

else

  zenitydistroResult=$(
    zenity --list --title="We could not find your distribution, please select one manually." --width="500" --height="400" \
    --column="Select" --column="Distribution Name" \
        "Ubuntu 19.04" \
        "Debian 9" \
        "Debian Based (GNOME not installed)" \
  )

  if [[ $zenitydistroResult == "Ubuntu 19.04" ]]; then
    cd /$HOME/spearmint-customizer/Ubuntu/19.04/
    chmod +x setup.sh
    ./setup.sh
  fi

  if [[ $zenitydistroResult == "Debian" ]]; then
    cd /$HOME/spearmint-customizer/Debian/9/
    chmod +x setup.sh
    ./setup.sh
  fi

  if [[ $zenitydistroResult == "Debian Based (GNOME not installed)" ]]; then
    cd /$HOME/spearmint-customizer/Debian/unknown/setup.sh
    chmod +x setup.sh
    ./setup.sh
  fi
