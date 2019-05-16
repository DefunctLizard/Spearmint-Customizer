#!/bin/bash

DISTRIBUTION=$(
  cat /etc/os-release
)

if [[ $DISTRIBUTION == "*Ubuntu 19.04*" ]]; then
  echo "starting Ubuntu setup"
fi
