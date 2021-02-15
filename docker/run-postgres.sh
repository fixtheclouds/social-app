#!/bin/sh

set -e

docker-compose exec db psql -U postgres
