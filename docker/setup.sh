#!/bin/sh

set -e

# Create .env and fill missing values
ADMIN_PASSWORD=$(cat /dev/urandom | tr -dc a-zA-Z0-9 | fold -w 14 | head -n 1)
cp .env.example .env
echo "ADMIN_PASSWORD=${ADMIN_PASSWORD}" >> .env

docker-compose exec web bundle exec rails db:create db:migrate db:seed
