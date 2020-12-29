#!/bin/sh
# We launch both cron scripts and Nginx in the same
# container for user simplicity.

# Start the cron daemon.
crond -f -l 2 &
# Init first synchronization.
/app/crons/sync_mirror.sh &
# Launch Nginx in foreground.
nginx -g "daemon off;"
