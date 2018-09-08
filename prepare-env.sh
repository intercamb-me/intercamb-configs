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

echo "Preparing environment..."
printf "\n\n"
sleep 5

$INTERCAMB_HOME/apps/intercamb-configs/certs/install-certs.sh
printf "\n\n"
sleep 5

$INTERCAMB_HOME/apps/intercamb-configs/certs/install-certs-tasks.sh
printf "\n\n"
sleep 5

$INTERCAMB_HOME/apps/intercamb-configs/docker/create-network.sh
printf "\n\n"
sleep 5

echo ""
echo "Enrivonment prepared with success!"
