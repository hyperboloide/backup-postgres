#!/bin/bash

set -e

DEST=dump-`date +%Y-%m-%d-%H:%M`.gz
echo $BUCKET/$BUCKET_DIR/$DEST

pg_dumpall -h postgres -U postgres \
    | gzip \
    | openssl enc -aes-256-cbc -salt -k $ENC_KEY \
    | aws s3 cp - $BUCKET/$BUCKET_DIR/$DEST
