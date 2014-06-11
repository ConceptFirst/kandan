#!/usr/bin/env bash

set -ue

ssh ubuntu@murakumo.everyleaf.com "cd ~/docker/kandan; git fetch origin; git checkout -f origin/master; ./docker/run.bash"
