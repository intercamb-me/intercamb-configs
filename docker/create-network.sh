#!/bin/bash

set -e

echo "Creating a Docker network called intercamb-network..."

docker network create \
  --driver bridge \
  --subnet 172.30.0.0/16 \
  --ip-range 172.30.5.0/24 \
  --gateway 172.30.5.254 \
  intercamb-network

echo ""
echo "Network intercamb-network was created with success!"
