#!/bin/bash

set -e

aws s3 ls $BUCKET/$BUCKET_DIR/

echo "Select a backup:"

read DEST

aws s3 cp "$BUCKET/$BUCKET_DIR/$DEST" - | \
    gunzip | \
    psql -h postgres -U postgres
