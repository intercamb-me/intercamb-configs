#!/bin/bash

set -e

echo "Creating user intercambio"

sudo adduser intercambio
sudo usermod -aG sudo intercambio
sudo groupadd docker || true
sudo usermod -aG docker intercambio

INTERCAMBIO_REGISTRY="554511234717.dkr.ecr.us-west-1.amazonaws.com"

echo "" | sudo tee --append /home/intercambio/.profile > /dev/null
echo "export INTERCAMBIO_HOME=\"/opt/intercambio\"" | sudo tee --append /home/intercambio/.profile > /dev/null
echo "export INTERCAMBIO_REGISTRY=\"$INTERCAMBIO_REGISTRY\"" | sudo tee --append /home/intercambio/.profile > /dev/null
echo "" | sudo tee --append /home/intercambio/.profile > /dev/null
echo "export NODE_HOME=\"\$INTERCAMBIO_HOME/tools/node\"" | sudo tee --append /home/intercambio/.profile > /dev/null
echo "PATH=\"\$NODE_HOME/bin:\$PATH\"" | sudo tee --append /home/intercambio/.profile > /dev/null
echo "" | sudo tee --append /home/intercambio/.profile > /dev/null
echo "cd \$INTERCAMBIO_HOME" | sudo tee --append /home/intercambio/.profile > /dev/null

echo "User intercambio created with success!"
