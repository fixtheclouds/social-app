#!/bin/sh

set -e

docker-compose exec web bundle exec rails db:console
