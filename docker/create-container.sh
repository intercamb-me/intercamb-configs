#!/bin/bash

set -e

if [ -z "$INTERCAMBIO_HOME" ]; then
  echo "Enrivonment variable with name INTERCAMBIO_HOME is required"
  exit 1
fi

if [ -z "$INTERCAMBIO_ECR_REGISTRY" ]; then
  echo "Enrivonment variable with name INTERCAMBIO_ECR_REGISTRY is required"
  exit 1
fi

if [ ! -d "$INTERCAMBIO_HOME/apps/intercambio-configs" ]; then
  echo "The project intercambio-configs must be located in $INTERCAMBIO_HOME/apps"
  exit 1
fi

if [ $# != 1 ]; then
  echo "Usage: $0 <image_name>"
  echo "Examples: $0 intercambio/intercambio"
  echo "          $0 redis"
  exit 1
fi

echo "Creating container $1..."

cd $INTERCAMBIO_HOME/apps/intercambio-configs/docker
cat docker-compose-override.yml $1/docker-compose.yml > docker-compose.yml
docker-compose up -d
rm docker-compose.yml

echo "Container $1 was created with success!"
