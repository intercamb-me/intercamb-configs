#!/bin/bash

set -e

echo "Creating Intercambio network on Docker..."

docker network create \
  --driver bridge \
  --subnet 172.30.0.0/16 \
  --ip-range 172.30.5.0/24 \
  --gateway 172.30.5.254 \
  intercambio-network

echo "Intercambio network was created with success!"
