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

echo "Creating directory tree"

mkdir -p $INTERCAMB_HOME/apps
mkdir -p $INTERCAMB_HOME/configs
mkdir -p $INTERCAMB_HOME/data
mkdir -p $INTERCAMB_HOME/data/letsencrypt
mkdir -p $INTERCAMB_HOME/logs
mkdir -p $INTERCAMB_HOME/public
mkdir -p $INTERCAMB_HOME/tools

mkdir -p $HOME/.backups
touch $HOME/.backups/credentials
chmod 700 $HOME/.backups
chmod 600 $HOME/.backups/credentials

echo ""
echo "Directory tree created with success!"
