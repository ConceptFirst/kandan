#!/usr/bin/env bash

set -ue

cd /app
bundle config jobs 4
bundle install
RAILS_ENV=production bundle exec rake db:create db:migrate kandan:bootstrap
RAILS_ENV=production bundle exec thin start
