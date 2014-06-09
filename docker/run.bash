#!/usr/bin/env bash

set -e

rails=$(cd $(dirname $0); cd ..; pwd)

cmd="docker run -p 8989:3000 -e DIGEST_AUTH_USER=$DIGEST_AUTH_USER -e DIGEST_AUTH_PASSWORD=$DIGEST_AUTH_PASSWORD -v $rails:/app -t kandan /app/docker/server.bash"
$cmd || sudo $cmd