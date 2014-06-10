#!/usr/bin/env bash

set -ue

ssh ubuntu@murakumo.everyleaf.com "cd ~/docker/kandan; git pull -f origin master; ./docker/run.bash"
