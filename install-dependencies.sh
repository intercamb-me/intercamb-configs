#!/bin/bash

set -e

if [ "$(whoami)" != "intercambio" ]; then
  echo "This script must be executed with the user intercambio"
  exit 1
fi

if [ -z "$INTERCAMBIO_HOME" ]; then
  echo "Enrivonment variable with name INTERCAMBIO_HOME is required"
  exit 1
fi

if [ ! -d "$INTERCAMBIO_HOME/apps/intercambio-configs" ]; then
  echo "The project intercambio-configs must be located in $INTERCAMBIO_HOME/apps"
  exit 1
fi

echo "Installing dependencies..."
printf "\n\n"
sleep 5

$INTERCAMBIO_HOME/apps/intercambio-configs/dependencies/install-node.sh
printf "\n\n"
sleep 5

$INTERCAMBIO_HOME/apps/intercambio-configs/dependencies/install-docker.sh
printf "\n\n"
sleep 5

$INTERCAMBIO_HOME/apps/intercambio-configs/dependencies/install-docker-compose.sh
printf "\n\n"
sleep 5

$INTERCAMBIO_HOME/apps/intercambio-configs/dependencies/install-awscli.sh
printf "\n\n"
sleep 5

$INTERCAMBIO_HOME/apps/intercambio-configs/dependencies/install-letsencrypt.sh
printf "\n\n"
sleep 5

echo "Dependencies installed with success!"
echo "Please log out and log back in with the user $USER."
