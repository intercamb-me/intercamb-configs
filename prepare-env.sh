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

echo "Preparing environment..."
printf "\n\n"
sleep 5

echo "Creating base directories..."
mkdir -p $INTERCAMBIO_HOME/public
mkdir -p $INTERCAMBIO_HOME/configs
mkdir -p $INTERCAMBIO_HOME/data
mkdir -p $INTERCAMBIO_HOME/data/letsencrypt
mkdir -p $INTERCAMBIO_HOME/logs
printf "\n\n"
sleep 5

$INTERCAMBIO_HOME/apps/intercambio-configs/certs/install-certs.sh
printf "\n\n"
sleep 5

$INTERCAMBIO_HOME/apps/intercambio-configs/certs/install-certs-tasks.sh
printf "\n\n"
sleep 5

$INTERCAMBIO_HOME/apps/intercambio-configs/docker/create-network.sh
printf "\n\n"
sleep 5

echo "Enrivonment prepared with success!"
