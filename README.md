# A Dockerized CTAN mirror

A Docker image for mirroring the [CTAN][https://ctan.org], aka _Comprehensive TeX Archive Network_.

This image is based on Alpine, use Nginx to serve CTAN directories and crontab with rsync for synching with the master CTAN archive.

## Getting started

Build image with Docker:

```sh
docker build -t gutenberg/ctan-mirror .
```

TODO Publish image on Docker Hub

Run with Docker, binding on port `8080`:

```sh
docker run -p 8080:80 gutenberg/ctan-mirror
```

## Resources

* https://ctan.org/mirrors/register?lang=en

## Credits

This image is brought to you by the [GUTenberg](https://www.gutenberg.eu.org/) team, the French user group of TeX, LaTeX and others.