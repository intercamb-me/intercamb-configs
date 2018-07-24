#!/bin/bash

set -e

echo "Creating user intercambio"

sudo adduser intercambio
sudo usermod -aG sudo intercambio
sudo groupadd docker || true
sudo usermod -aG docker intercambio

echo "User intercambio created with success!"
