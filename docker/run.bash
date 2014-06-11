#!/usr/bin/env bash

set -e

retry_with_sudo () {
  cmd="$@"
  $cmd || (echo "Retry with sudo: " >&2 && sudo $cmd)
}

rails=$(cd $(dirname $0); cd ..; pwd)

# Set production DB
if !(grep -q -F 'production:' $rails/config/database.yml); then
cat <<YAML >> $rails/config/database.yml

production:
  adapter: sqlite3
  database: db/development.sqlite3 # 最初developmentで色々やってしまったので使いまわす
  pool: 5
  timeout: 5000
YAML
fi

# container stop(or kill) if exists
ID=$(retry_with_sudo docker ps | grep '8989->3000' | awk '{print $1}')
[[ -n $ID ]] && (
  retry_with_sudo docker stop $ID || retry_with_sudo docker kill $ID
)


# launch
cmd="docker run -p 8989:3000 -e DIGEST_AUTH_USER=$DIGEST_AUTH_USER -e DIGEST_AUTH_PASSWORD=$DIGEST_AUTH_PASSWORD -v $rails:/app -t kandan /app/docker/server.bash"
retry_with_sudo $cmd
