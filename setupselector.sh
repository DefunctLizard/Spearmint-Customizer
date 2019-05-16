#!/bin/bash

DISTRIBUTION=$(cat /etc/os-release)

if [[ $DISTRIBUTION == "*ubuntu*" ]]; then
  echo "starting Ubuntu setup"
fi
