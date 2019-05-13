#!/bin/bash

DISTRIBUTION=unknown

DISTRIBUTION=$( cat /etc/os-release )

if [[ $DISTRIBUTION == *"Debian"* ]]; then
  cd /$HOME/spearmint-customizer/Debian/
  chmod +x setup.sh
  ./setup.sh
fi

if [[ $DISTRIBUTION == *"Ubuntu"* ]]; then
  cd /$HOME/spearmint-customizer/Ubuntu/
  chmod +x setup.sh
  ./setup.sh
fi
