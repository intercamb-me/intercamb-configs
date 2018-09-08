#!/bin/bash

set -e

if [ -z "$INTERCAMB_HOME" ]; then
  echo "Enrivonment variable with name INTERCAMB_HOME is required"
  exit 1
fi

if [ -z "$INTERCAMB_ECR_REGISTRY" ]; then
  echo "Enrivonment variable with name INTERCAMB_ECR_REGISTRY is required"
  exit 1
fi

if [ ! -d "$INTERCAMB_HOME/apps/intercamb-configs" ]; then
  echo "The project intercamb-configs must be located in $INTERCAMB_HOME/apps"
  exit 1
fi

if [ $# != 1 ]; then
  echo "Usage: $0 <image_name>"
  echo "Examples: $0 intercamb/intercamb"
  echo "          $0 redis"
  exit 1
fi

echo "Creating container $1..."

cd $INTERCAMB_HOME/apps/intercamb-configs/docker
cat docker-compose-override.yml $1/docker-compose.yml > docker-compose.yml
docker-compose up -d
rm docker-compose.yml

echo ""
if [ $? -eq 0 ]
then
  echo "Container $1 was created with success!"
else
  echo "Error creating container $1!"
fi
