#!/bin/bash

DISTRIBUTION=unknown

DISTRIBUTION=$( cat /etc/os-release )

if [[ $DISTRIBUTION == *"Ubuntu 19.04"* ]]; then
  cd /$HOME/spearmint-customizer/Ubuntu/19.04/
  chmod +x setup.sh
  ./setup.sh
fi

if [[ $DISTRIBUTION == *"Debian GNU/Linux 9 (stretch)"* ]]; then
  cd /$HOME/spearmint-customizer/Debian/19.04/
  chmod +x setup.sh
  ./setup.sh
fi
