#!/bin/sh
# We launch both cron scripts and Nginx in the same
# container for user simplicity.

# Start the cron daemon.
crond -f -l 2 &
# Launch Nginx in foreground.
nginx -g "daemon off;"
