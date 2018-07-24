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

if [ -z "$INTERCAMBIO_ECR_REGION" ]; then
  echo "Enrivonment variable with name INTERCAMBIO_ECR_REGION is required"
  exit 1
fi

if [ ! -d "$INTERCAMBIO_HOME/apps/intercambio-configs" ]; then
  echo "The project intercambio-configs must be located in $INTERCAMBIO_HOME/apps"
  exit 1
fi

echo "Pulling images..."

eval $(aws ecr get-login --no-include-email --region $INTERCAMBIO_ECR_REGION)

docker pull $INTERCAMBIO_ECR_REGISTRY/intercambio/intercambio:latest
docker tag $INTERCAMBIO_ECR_REGISTRY/intercambio/intercambio:latest intercambio:latest

docker pull $INTERCAMBIO_ECR_REGISTRY/intercambio/intercambio-website:latest
docker tag $INTERCAMBIO_ECR_REGISTRY/intercambio/intercambio-website:latest intercambio-website:latest

# docker pull $INTERCAMBIO_ECR_REGISTRY/intercambio/intercambio-prerender:latest
# docker tag $INTERCAMBIO_ECR_REGISTRY/intercambio/intercambio-prerender:latest intercambio-prerender:latest

echo "Images pulled with success!"
