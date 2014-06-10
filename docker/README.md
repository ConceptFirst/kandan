```console
$ docker build -t kandan . # or `sudo docker ...`
$ ./run.bash
```

Then visit localhost:8989

# run.bash

1. database.ymlにproductionを足す
2. dockerコンテナがいれば止めるか殺す
3. dockerコンテナを起動する。その際ポートマッピング（host:8989 - guest:3000）とディレクトリ共有を行いつつserver.bashをコンテナ内で実行する

# server.bash

1. /app（Railsアプリ）へ移動してbundle install
2. (RAILS_ENV=production)db:migrateなど
3. (RAILS_ENV=production)bundle exec thin startで起動

