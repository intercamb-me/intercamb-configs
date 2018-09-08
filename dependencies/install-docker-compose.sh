#!/bin/bash

set -e

echo "Installing Docker Compose..."

sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo ""
if [ $? -eq 0 ]
then
  echo "Docker Compose installed with success!"
else
  echo "Error installing Docker Compose!"
fi
