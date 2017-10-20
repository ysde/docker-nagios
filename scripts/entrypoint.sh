#!/bin/bash

set -x

# Install postfix package if it is not exiting. also, restart the postfix service.
/init-postfix.sh

# Install pagerduty package if it is not exiting. also, restart the pagerduty agent.
/init-pagerduty-agent.sh

# Sync Nagios etc directory from working to original directory
rsync -av --ignore-existing /var/opt/nagios/etc /usr/local/nagios

# Sync Nagios var directory from working to original directory
rsync -av --ignore-existing /var/opt/nagios/var /usr/local/nagios

sed -i "s/80/${NAGIOS_PORT:-80}/g" /etc/apache2/sites-available/000-default.conf /etc/apache2/ports.conf

# Restart the Nagios Service
service nagios restart

# Restart the Apache2 Service
service apache2 restart


tail -f /usr/local/nagios/var/nagios.log

exec "$@"
