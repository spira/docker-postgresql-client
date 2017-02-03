#!/bin/bash

POSTGRES_USER=${POSTGRES_USER:-${DB_ENV_POSTGRES_USER}}
POSTGRES_PASSWORD=${POSTGRES_PASSWORD:-${DB_ENV_POSTGRES_PASSWORD}}
POSTGRES_HOST=${POSTGRES_HOST:-${DB_ENV_POSTGRES_HOST}}

echo "${POSTGRES_HOST}:*:*:"${POSTGRES_USER}":"${POSTGRES_PASSWORD} > ~/.pgpass
chmod 0600 ~/.pgpass

"$@" -U ${POSTGRES_USER} -h ${POSTGRES_HOST:-db}
