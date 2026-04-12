#!/bin/bash
set -e

echo "Waiting for PostgreSQL to start..."
until pg_isready -U "$POSTGRES_USER"; do
  sleep 1
done

echo "Restoring database from backup..."

pg_restore \
  --username="$POSTGRES_USER" \
  --dbname="$POSTGRES_DB" \
  --verbose \
  /backups/litedb.tar

echo "Restore completed!"