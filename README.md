# A Dockerized CTAN mirror

A Docker image for mirroring the [CTAN](https://ctan.org), aka _Comprehensive TeX Archive Network_. Available on the Docker Hub as [`gutenberg/ctan-mirror`](https://hub.docker.com/r/gutenberg/ctan-mirror).

This image is based on Alpine, use Nginx to serve CTAN directories and crontab with rsync for synching with the master CTAN archive.

You need (as of December, 2020) approximately 43 Go of available disk space to mirror the CTAN.

## Getting started

Run with Docker, binding on port `8080`:

```sh
docker run -p 8080:80 gutenberg/ctan-mirror
```

### Options


| Env variable   |   Default Value  |  Meaning |
|----------|-------------|------|
| `CTAN_RSYNC_MIRROR` |  The rsync mirror URI to sync from | `rsync.dante.ctan.org/CTAN` |
| `SYNC_CRON_PERIOD` | The rsync cron periodicity | `42 6,12,18,23 * * *` |
| `RANDOM_MODULO` | Random modulo used to differ the sync script (used with `$[RANDOM%<RANDOM_MODULO>]`) | `179` |

### Building the image from code

Build image with Docker:

```sh
docker build -t gutenberg/ctan-mirror .
```

## Resources

* https://ctan.org/mirrors/register?lang=en

## Credits

This image is brought to you by the [GUTenberg](https://www.gutenberg.eu.org/) team, the French user group of TeX, LaTeX and others.