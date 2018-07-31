#!/bin/bash

set -e

echo "Creating user intercamb"

sudo adduser intercamb
sudo usermod -aG sudo intercamb
sudo groupadd docker || true
sudo usermod -aG docker intercamb

INTERCAMB_ECR_REGISTRY="554511234717.dkr.ecr.us-west-1.amazonaws.com"
INTERCAMB_ECR_REGION="us-west-1"

echo "" | sudo tee --append /home/intercamb/.profile > /dev/null
echo "export INTERCAMB_HOME=\"/opt/intercamb\"" | sudo tee --append /home/intercamb/.profile > /dev/null
echo "export INTERCAMB_ECR_REGISTRY=\"$INTERCAMB_ECR_REGISTRY\"" | sudo tee --append /home/intercamb/.profile > /dev/null
echo "export INTERCAMB_ECR_REGION=\"$INTERCAMB_ECR_REGION\"" | sudo tee --append /home/intercamb/.profile > /dev/null
echo "" | sudo tee --append /home/intercamb/.profile > /dev/null
echo "cd \$INTERCAMB_HOME" | sudo tee --append /home/intercamb/.profile > /dev/null

echo "User intercamb created with success!"
