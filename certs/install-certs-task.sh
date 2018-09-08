#!/bin/bash

set -e
set -f

if [ "$(whoami)" != "root" ]; then
  echo "This script must be executed with the user root"
  exit 1
fi

if [ -z "$INTERCAMB_HOME" ]; then
  echo "Enrivonment variable with name INTERCAMB_HOME is required"
  exit 1
fi

echo "Installing certificate cron task..."

CRON_RENEW_CMD="$INTERCAMB_HOME/apps/intercamb-configs/certs/renew-certs.sh"
CRON_RENEW_JOB="0 0 * * * $CRON_RENEW_CMD"

(crontab -l | grep -v -F "$CRON_RENEW_CMD") | crontab - || true
(crontab -l | grep -v -F "$CRON_RENEW_CMD" ; echo "$CRON_RENEW_JOB") | crontab - || true

echo "Certificate cron task was installed with success!"
echo "Current tasks:"
crontab -l
