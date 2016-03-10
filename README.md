# backup-postgres
A simple Docker container to backup PostgreSQL to S3.

### Backup PostgreSQL

```
docker run --rm \
        --net www_default \
        -v ~/.aws:/aws \
        --link postgres:postgres \
        -e BUCKET=s3://bucket.example.com
        -e PGHOST=postgres
        -e PGUSER=user
        -e PGPASSWORD=passwd \
        hyperboloide/backup-postgres \
        backup
```

### Restore PostgreSQL

```
docker run --rm -ti \
        -v ~/.aws:/aws \
        --link postgres-restore:postgres \
        -e BUCKET=s3://bucket.example.com
        -e PGHOST=postgres
        -e PGUSER=user
        -e PGPASSWORD=passwd \
        hyperboloide/backup-password \
        restore
```
