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

echo "Creating directory tree"

mkdir -p $INTERCAMBIO_HOME/apps
mkdir -p $INTERCAMBIO_HOME/configs
mkdir -p $INTERCAMBIO_HOME/data
mkdir -p $INTERCAMBIO_HOME/data/letsencrypt
mkdir -p $INTERCAMBIO_HOME/logs
mkdir -p $INTERCAMBIO_HOME/public
mkdir -p $INTERCAMBIO_HOME/tools

echo "Directory tree created with success!"
