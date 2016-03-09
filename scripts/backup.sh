#!/bin/bash

set -e

DEST=dump-`date +%Y-%m-%d-%H:%M`.gz
echo $DEST

pg_dumpall -h postgres -U postgres \
    | gzip \
    | aws s3 cp - $BUCKET/$BUCKET_DIR/$DEST
