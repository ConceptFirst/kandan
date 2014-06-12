#!/usr/bin/env bash

set -ue

# to background for Circle CI timeout workaround
# https://circleci.com/gh/everyleaf-internal/kandan/9
ssh ubuntu@murakumo.everyleaf.com "cd ~/docker/kandan; git fetch origin; git checkout -f origin/master; ./docker/run.bash" &
