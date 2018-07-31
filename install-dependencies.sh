#!/bin/bash

set -e

if [ "$(whoami)" != "intercamb" ]; then
  echo "This script must be executed with the user intercamb"
  exit 1
fi

if [ -z "$INTERCAMB_HOME" ]; then
  echo "Enrivonment variable with name INTERCAMB_HOME is required"
  exit 1
fi

if [ ! -d "$INTERCAMB_HOME/apps/intercamb-configs" ]; then
  echo "The project intercamb-configs must be located in $INTERCAMB_HOME/apps"
  exit 1
fi

echo "Installing dependencies..."
printf "\n\n"
sleep 5

sudo apt-get install python
printf "\n\n"
sleep 5

$INTERCAMB_HOME/apps/intercamb-configs/dependencies/install-docker.sh
printf "\n\n"
sleep 5

$INTERCAMB_HOME/apps/intercamb-configs/dependencies/install-docker-compose.sh
printf "\n\n"
sleep 5

$INTERCAMB_HOME/apps/intercamb-configs/dependencies/install-awscli.sh
printf "\n\n"
sleep 5

$INTERCAMB_HOME/apps/intercamb-configs/dependencies/install-letsencrypt.sh
printf "\n\n"
sleep 5

echo "Dependencies installed with success!"
echo "Please log out and log back in with the user $USER."
