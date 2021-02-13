#!/bin/sh

set -e

docker-compose exec web sh "$@"
