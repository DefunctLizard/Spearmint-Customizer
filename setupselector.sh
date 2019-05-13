#!/bin/bash

DISTRIBUTION=unknown

DISTRIBUTION=$( cat /etc/os-release )

if [[ $DISTRIBUTION == *"Ubuntu 19.04"* ]]; then
  cd /$HOME/spearmint-customizer/Ubuntu/19.04/
  chmod +x setup.sh
  ./setup.sh
fi

if [[ $DISTRIBUTION == *"Debian GNU/Linux 9 (stretch)"* ]]; then
  cd /$HOME/spearmint-customizer/Debian/9/
  chmod +x setup.sh
  ./setup.sh
fi

if [[ $DISTRIBUTION == *"Ubuntu 18.04.2"* ]]; then
  cd /$HOME/spearmint-customizer/Ubuntu/18.04.2/
  chmod +x setup.sh
  ./setup.sh
fi

if [[ $DISTRIBUTION == "unknown"]]; then
  echo "could not detect distribution"
