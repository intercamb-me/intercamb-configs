#!/bin/bash

set -e
set -f

if [ -z "$INTERCAMB_HOME" ]; then
  echo "Enrivonment variable with name INTERCAMB_HOME is required"
  exit 1
fi

echo "Installing Mongo backup cron task..."

CRON_BACKUP_CMD="$INTERCAMB_HOME/apps/intercamb-configs/docker/mongo/backup.sh"
CRON_BACKUP_JOB="0 0 * * * $CRON_BACKUP_CMD"

(crontab -l | grep -v -F "$CRON_BACKUP_CMD") | crontab - || true
(crontab -l | grep -v -F "$CRON_BACKUP_CMD" ; echo "$CRON_BACKUP_JOB") | crontab - || true

echo ""
if [ $? -eq 0 ]
then
  echo "Mongo backup cron task was installed with success!"
  echo "Current tasks:"
  crontab -l
else
  echo "Error installing Mongo backup cron task!"
fi
