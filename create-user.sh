#!/bin/bash

set -e

echo "Creating user intercambio"

sudo adduser intercambio
sudo usermod -aG sudo intercambio
sudo groupadd docker || true
sudo usermod -aG docker intercambio

INTERCAMBIO_ECR_REGISTRY="554511234717.dkr.ecr.us-west-1.amazonaws.com"
INTERCAMBIO_ECR_REGION="us-west-1"

echo "" | sudo tee --append /home/intercambio/.profile > /dev/null
echo "export INTERCAMBIO_HOME=\"/opt/intercambio\"" | sudo tee --append /home/intercambio/.profile > /dev/null
echo "export INTERCAMBIO_ECR_REGISTRY=\"$INTERCAMBIO_ECR_REGISTRY\"" | sudo tee --append /home/intercambio/.profile > /dev/null
echo "export INTERCAMBIO_ECR_REGION=\"$INTERCAMBIO_ECR_REGION\"" | sudo tee --append /home/intercambio/.profile > /dev/null
echo "" | sudo tee --append /home/intercambio/.profile > /dev/null
echo "export NODE_HOME=\"\$INTERCAMBIO_HOME/tools/node\"" | sudo tee --append /home/intercambio/.profile > /dev/null
echo "PATH=\"\$NODE_HOME/bin:\$PATH\"" | sudo tee --append /home/intercambio/.profile > /dev/null
echo "" | sudo tee --append /home/intercambio/.profile > /dev/null
echo "cd \$INTERCAMBIO_HOME" | sudo tee --append /home/intercambio/.profile > /dev/null

echo "User intercambio created with success!"
