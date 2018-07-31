#!/bin/bash

set -e
set -f

if [ -z "$INTERCAMB_HOME" ]; then
  echo "Enrivonment variable with name INTERCAMB_HOME is required"
  exit 1
fi

echo "Installing certificate cron tasks..."

CRON_RENEW_CMD="$INTERCAMB_HOME/apps/intercamb-configs/certs/renew-certs.sh"
CRON_RENEW_JOB="0 0 * * * $CRON_RENEW_CMD"

(sudo crontab -l | grep -v -F "$CRON_RENEW_CMD") | sudo crontab - || true
(sudo crontab -l | grep -v -F "$CRON_RENEW_CMD" ; echo "$CRON_RENEW_JOB") | sudo crontab - || true

echo "Certificate cron tasks was installed with success!"
echo "Current tasks:"
sudo crontab -l
