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
  if [[ $DISTRIBUTION == *"Debian"* ]]; then
    cd /$HOME/spearmint-customizer/Debian/gnomeless/
    chmod +x setup.sh
    ./setup.sh
  fi

  if [[ $DISTRIBUTION == *"Ubuntu"* ]]; then
    cd /$HOME/spearmint-customizer/Ubuntu/gnomeless/
    chmod +x setup.sh
    ./setup.sh
  fi
fi || cd /$HOME/spearmint-customizer/macOS/; chmod +x setup.sh; ./setup.sh#!/bin/bash

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
  if [[ $DISTRIBUTION == *"Debian"* ]]; then
    cd /$HOME/spearmint-customizer/Debian/gnomeless/
    chmod +x setup.sh
    ./setup.sh
  fi

  if [[ $DISTRIBUTION == *"Ubuntu"* ]]; then
    cd /$HOME/spearmint-customizer/Ubuntu/gnomeless/
    chmod +x setup.sh
    ./setup.sh
  fi
fi || echo "I work"
