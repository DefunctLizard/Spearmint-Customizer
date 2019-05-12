#!/bin/bash

DISTRIBUTION=unknown

DISTRIBUTION=$( cat /etc/os-release )
echo "this is your distribution: $DISTRIBUTION"
