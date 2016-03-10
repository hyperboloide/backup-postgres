#!/bin/bash

set -e

aws s3 ls $BUCKET/postgres/

echo "Select a backup:"

read DEST

aws s3 cp "$BUCKET/$BUCKET_DIR/$DEST" - | \
    gunzip | \
    psql -h postgres -U postgres
