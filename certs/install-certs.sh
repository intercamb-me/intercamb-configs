#!/bin/bash

set -e

if [ -z "$INTERCAMB_HOME" ]; then
  echo "Enrivonment variable with name INTERCAMB_HOME is required"
  exit 1
fi

echo "Installing intercamb.me certificate..."
sudo letsencrypt certonly --standalone -d intercamb.me

echo "Installing api.intercamb.me certificate..."
sudo letsencrypt certonly --standalone -d api.intercamb.me

echo "Installing www.intercamb.me certificate..."
sudo letsencrypt certonly --standalone -d www.intercamb.me

echo "Certificates installed with success!"
