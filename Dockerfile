FROM postgres

ENV AWS_CONFIG_FILE=/aws/config
ENV AWS_SHARED_CREDENTIALS_FILE=/aws/credentials
ENV AWS_DEFAULT_REGION=eu-central-1

ENV BUCKET=s3://the_bucket
ENV BUCKET_DIR=/postgres

ENV PGHOST=postgres
ENV PGPORT=5432
ENV PGUSER=postgres
ENV PGPASSWORD=postgres

WORKDIR /usr/local/bin
COPY scripts/*       ./
RUN  chmod 555 *.sh

WORKDIR /tmp
RUN apt-get update -qq && \
    apt-get install -qqy curl unzip python \
    && apt-get clean \
    && curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip" \
    && unzip awscli-bundle.zip \
    && ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws \
    && rm -fr /var/lib/apt/lists/* /tmp/* /var/tmp/*
