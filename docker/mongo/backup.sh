#!/bin/bash

set -e

source $HOME/.profile
source $HOME/.backups/credentials

if [ -z "$INTERCAMB_HOME" ]; then
  echo "Enrivonment variable with name INTERCAMB_HOME is required"
  exit 1
fi

if [ -z "$MONGO_PASSWORD" ]; then
  echo "Enrivonment variable with name MONGO_PASSWORD is required"
  exit 1
fi

exec &> $INTERCAMB_HOME/logs/mongo-backup.log

echo ""
echo "#############################################################"
echo "## Generating Mongo backup at $(date) ##"
echo "#############################################################"
echo ""

DATABASE=intercamb
BUCKET=intercamb-backups
FILENAME=mongo-$(date "+%Y%m%d%H%M%S").bkp
USERNAME=intercamb

# Dump from Mongo and upload to S3
docker run --rm -it --network intercamb-network mongo:4.1.1 mongodump --host mongo --db $DATABASE --username $USERNAME --password $MONGO_PASSWORD --authenticationDatabase admin --archive --gzip | aws s3 cp - s3://$BUCKET/$FILENAME

echo ""
if [ $? -eq 0 ]
then
  echo "Backup generated and uploaded to S3 with success!"
else
  echo "Error generating backup or uploading to S3!"
fi
