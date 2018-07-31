#!/bin/bash

set -e

source $HOME/.profile

if [ -z "$INTERCAMB_HOME" ]; then
  echo "Enrivonment variable with name INTERCAMB_HOME is required"
  exit 1
fi

exec &> $INTERCAMB_HOME/logs/renew-certs.log

echo ""
echo "###########################################################"
echo "## Renewing certificates at $(date) ##"
echo "###########################################################"

echo ""
echo "1º Renewing intercamb.me certificate..."
echo ""
sudo letsencrypt certonly -n --webroot -w $INTERCAMB_HOME/data/letsencrypt -d intercamb.me

echo ""
echo "2º Renewing api.intercamb.me certificate..."
echo ""
sudo letsencrypt certonly -n --webroot -w $INTERCAMB_HOME/data/letsencrypt -d api.intercamb.me

echo ""
echo "3º Renewing www.intercamb.me certificate..."
echo ""
sudo letsencrypt certonly -n --webroot -w $INTERCAMB_HOME/data/letsencrypt -d www.intercamb.me

echo ""
echo "Certificates renewed with success!"
