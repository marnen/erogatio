#!/bin/sh
# See https://medium.com/@cristian_rivera/cache-rails-bundle-w-docker-compose-45512d952c2d for why this works.

set -e
bundle --version || (gem install bundler && bundle binstubs bundler --force) || /bin/true
bundle check || bundle install --binstubs="$BUNDLE_BIN"
exec "$@"
