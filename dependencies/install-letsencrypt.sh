#!/bin/bash

set -e

echo "Installing Let's Encrypt..."

sudo apt-get update
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:certbot/certbot
sudo apt-get update
sudo apt-get install certbot

echo ""
if [ $? -eq 0 ]
then
  echo "Let's Encrypt was installed with success!"
else
  echo "Error installing Let's Encrypt!"
fi
