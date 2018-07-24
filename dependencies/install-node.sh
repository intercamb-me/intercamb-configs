#!/bin/bash

set -e

if [ -z "$INTERCAMBIO_HOME" ]; then
  echo "Enrivonment variable with name INTERCAMBIO_HOME is required"
  exit 1
fi

echo "Installing Node.js..."

cd $INTERCAMBIO_HOME/tools
wget https://nodejs.org/dist/v8.11.3/node-v8.11.3-linux-x64.tar.xz
ln -s node-v8.11.3-linux-x64.tar.xz node
rm node-v8.11.3-linux-x64.tar.xz

echo "Node.js installed with success!"
