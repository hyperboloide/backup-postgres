# backup-postgres
A simple Docker container to create and encrypted backup of PostgreSQL to S3.

### Backup PostgreSQL

```
docker run --rm \
        -v ~/.aws:/aws \
        --link postgres:postgres \
        -e BUCKET=s3://bucket.example.com \
        -e ENC_KEY=encryption_string \
        -e PGHOST=postgres \
        -e PGUSER=user \
        -e PGPASSWORD=passwd \
        hyperboloide/backup-postgres \
        backup
```

### Restore PostgreSQL

```
docker run --rm -ti \
        -v ~/.aws:/aws \
        --link postgres-restore:postgres \
        -e BUCKET=s3://bucket.example.com \
        -e ENC_KEY=encryption_string \
        -e PGHOST=postgres \
        -e PGUSER=user \
        -e PGPASSWORD=passwd \
        hyperboloide/backup-password \
        restore
```
