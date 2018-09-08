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

if [ -z "$INTERCAMB_ECR_REGION" ]; then
  echo "Enrivonment variable with name INTERCAMB_ECR_REGION is required"
  exit 1
fi

if [ ! -d "$INTERCAMB_HOME/apps/intercamb-configs" ]; then
  echo "The project intercamb-configs must be located in $INTERCAMB_HOME/apps"
  exit 1
fi

echo "Pulling images..."

eval $(aws ecr get-login --no-include-email --region $INTERCAMB_ECR_REGION)

docker pull $INTERCAMB_ECR_REGISTRY/intercamb/intercamb:latest
docker tag $INTERCAMB_ECR_REGISTRY/intercamb/intercamb:latest intercamb:latest

docker pull $INTERCAMB_ECR_REGISTRY/intercamb/intercamb-website:latest
docker tag $INTERCAMB_ECR_REGISTRY/intercamb/intercamb-website:latest intercamb-website:latest

# docker pull $INTERCAMB_ECR_REGISTRY/intercamb/intercamb-prerender:latest
# docker tag $INTERCAMB_ECR_REGISTRY/intercamb/intercamb-prerender:latest intercamb-prerender:latest

echo ""
echo "Images pulled with success!"
