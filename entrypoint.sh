#!/bin/sh
# We launch both cron scripts and Nginx in the same
# container for user simplicity.

# When the /var/ctan_mirror directory is mounted as a volume,
# its content can be empty at first start.
# Thus we copy the index.html again here (see also Dockerfile).
if [ ! -f "/var/ctan_mirror/index.html" ]; then
    echo "Copying index.html"
    cp /app/index.html /var/ctan_mirror/index.html
fi

# We install crontab at startup to allow for customizable
# periodicity. (through an env variable)
# Add crontab file in the cron directory.
echo "$SYNC_CRON_PERIOD sleep \$[RANDOM\%$RANDOM_MODULO] ; /app/crons/sync_mirror.sh > /proc/1/fd/1 2>/proc/1/fd/2" \
    > /etc/crontabs/ctan-cron
# Give execution rights on the cron job.
chmod 0644 /etc/crontabs/ctan-cron
# Set as main crontab file.
crontab /etc/crontabs/ctan-cron

# Start the cron daemon.
crond -f -l 2 &
# Init first synchronization.
/app/crons/sync_mirror.sh &
# Launch Nginx in foreground.
nginx -g "daemon off;"
