FROM nginx:alpine
LABEL maintainer="Yoan Tournade <y@yoantournade.com>"

ENV CTAN_RSYNC_MIRROR="rsync.dante.ctan.org/CTAN"
ENV SYNC_CRON_PERIOD="42 6,12,18,23 * * *"
ENV RANDOM_MODULO="179"

RUN apk add --no-cache \
    rsync \
    bash

# Add cron script(s).
RUN mkdir -p /app/crons
ADD cron/sync_mirror.sh /app/crons/sync_mirror.sh

# Give execution rights on the cron scripts.
RUN chmod 755 /app/crons/sync_mirror.sh

# Create directory for CTAN mirror data.
RUN mkdir -p /var/ctan_mirror

# Copy initial index.html (before synchronization).
ADD nginx/index.html /var/ctan_mirror/index.html

# Add custom Nginx conf.
ADD nginx/default.conf /etc/nginx/conf.d/default.conf

# Copy entrypoint script.
ADD entrypoint.sh /etc/entrypoint.sh

WORKDIR "/var/ctan_mirror"
CMD ["sh", "/etc/entrypoint.sh"]