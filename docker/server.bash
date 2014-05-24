#!/usr/bin/env bash

set -ue

cd /app
bundle config jobs 4
bundle install
bundle exec rake db:create db:migrate kandan:bootstrap
bundle exec rails s
