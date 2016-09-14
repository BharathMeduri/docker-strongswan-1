#!/bin/bash -e

if [ "$1" == "init" ]; then
  echo "Intializing config"
  ./init.sh
else
  echo "Starting VPN server"
  ./start.sh
fi
