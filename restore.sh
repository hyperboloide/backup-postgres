#!/bin/bash

set -e

aws s3 ls $BUCKET/postgres/

echo "Select a backup:"

read DEST

aws s3 cp "$BUCKET/$BUCKET_DIR/$DEST" - | \
    openssl enc -aes-256-cbc -d -k $ENC_KEY | \
    gunzip | \
    psql -h postgres -U postgres
