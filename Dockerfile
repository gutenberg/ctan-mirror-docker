FROM nginx:alpine
LABEL maintainer="Yoan Tournade <y@yoantournade.com>"

RUN apk add --no-cache \
    rsync \
    bash
    # openssh

# Add crontab file in the cron directory.
ADD cron/crontab /etc/crontabs/ctan-cron
RUN crontab /etc/crontabs/ctan-cron

# Add cron script(s).
RUN mkdir -p /app/crons
ADD cron/sync_mirror.sh /app/crons/sync_mirror.sh

# Give execution rights on the cron job
RUN chmod 755 /etc/crontabs/ctan-cron /app/crons/sync_mirror.sh

# Create directory for CTAN mirror data.
RUN mkdir -p /var/ctan_mirror

# Add custom Nginx conf.
ADD nginx/default.conf /etc/nginx/conf.d/default.conf

# Copy entrypoint script.
ADD entrypoint.sh /etc/entrypoint.sh

CMD ["sh", "/etc/entrypoint.sh"]