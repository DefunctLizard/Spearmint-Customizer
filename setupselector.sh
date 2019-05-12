#!/bin/bash

DISTRIBUTION=unknown

DISTRIBUTION=$( cat /etc/os-release )

if [[ $DISTRIBUTION == *"PRETTY_NAME="Ubuntu 19.04""* ]]; then
  cd /$HOME/spearmint-customizer/Ubuntu/19.04/
  chmod +x setup.sh
  ./setup.sh
fi
