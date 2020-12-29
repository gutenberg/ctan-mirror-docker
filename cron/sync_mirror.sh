#!/bin/bash

RSYNC_MIRROR="rsync.dante.ctan.org/CTAN"

echo "Synching CTAN mirror from $RSYNC_MIRROR... (@`date`)"
rsync -vaz --chmod='go+rX,go-w' --compress-level=7 --skip-compress=7z/ace/apk/avi/bz2/deb/flac/gpg/gz/iso/jar/jpeg/jpg/lz/lz4/lzma/lzo/mkv/mov/mp3/mp4/odb/odf/odg/odi/odm/odp/ods/odt/ogg/ogv/opus/otg/oth/otp/ots/ott/oxt/png/rar/rpm/rz/rzip/squashfs/sxc/sxd/sxg/sxm/sxw/tbz/tgz/tlz/txz/tzo/webm/webp/xz/z/zip/zst --delete-delay --delay-updates --ipv4 rsync://$RSYNC_MIRROR /var/ctan_mirror
echo "Synching CTAN mirror from $RSYNC_MIRROR: done! (@`date`)"
