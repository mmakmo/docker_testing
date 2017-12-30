# Redmine Testing Environment on Docker

## System
Docker Compose で構築しました。

Redmineのちょっとしたこと確認用なので、とりあえず動く物を用意しています。

* redmine 0.8.4
  - Exposed port#: 8084
  - `setup.sh`にてデフォルトテーブルを設定し, `start.sh` 実行時に起動します
* redmine [1.2.0, 2.6.0, 3.4.0]
  - Exposed port#: [8120, 8260, 8340]
  - DB migration, webアプリケーションサーバ起動は必要に応じて手動で行います。
  - {version}: [1_2_0, 2_6_0, 3_4_0]
    - DB migration: `docker exec redmine_{version} /setup.sh`
    - set DB default: `docker exec redmine_{version} /set_default.sh`
    - start web app: `docker exec redmine_{version} /start.sh`
* MySQL 5.6 (container name: redmine_mysql_5_6)
  - Exposed port#: 33306
  - root user ac/pw: root/password
  - redmine user ac/pw: redmine/redmine

## Pre-Required
* Windows
  - Docker Toolbox
  - Bash Terminal (for example: MSYS, Git Bash, Cygwin, ...)
* Linux/Mac
  - Docker

## Setup

### Update MySQL Setting (If Required)
必要に応じて、MySQLの設定を更新する。

この作業は初回のみで良い。

対象ファイル: `mysql/custom.cnf`

### Set http/https Environment Variables
Proxy設定が必要な場合、環境変数として事前に設定するか、もしくは `docker-compose.yml` が存在しているディレクトリ内に `.env` ファイルを用意する。

この作業は初回のみで良い。

```bash
$ # 環境変数として用意する場合の例
$ http_proxy=proxy.example.com:80
$ https_proxy=proxy.example.com:443
```

```bash
$ # .env ファイルを用意する場合の例
$ cat .env
http_proxy=proxy.example.com:80
https_proxy=proxy.example.com:443
```

### Setup Containers
初回もしくは `docker-compose down` を実行した後で改めてコンテナを作成する場合に実行する。

基本的に初回のみ行う。

```bash
$ ./setup.sh
```

## Usage (Docker Compose)

### Access to Redmine Server from Web Browser
* for Windows(useing Docker Toolbox): `http://192.168.99.100:8084/` (Redmine 0.8.4 / IP address is just example)
* for Linux or Mac: `http://localhost:8084/`
* Redmine login username / password: `admin` / `admin`

### Start Containers
最初のコンテナ作成時以降に、全てのコンテナを起動したい場合に実行する。
```bash
$ ./start.sh
```

### Stop Containers
```bash
$ docker-compose stop
```

### Shutdown Containers
```bash
$ docker-compose down
```

## Usage (Each Docker Container (Especially Redmine Containers))

### DB Migration for Each Redmine
手動で各 Redmine の DB migration を実行する際に使用する。

必要に応じて実行する。
```bash
$ # version = [0_8_4, 1_2_0, 2_6_0, 3_4_0]
$ docker exec redmine_{version} /setup.sh
```

### Load Default DB Tables for Each Redmine
手動で各 Redmine の デフォルトDBテーブルを用意する際に使用する。

必要に応じて実行する。
```bash
$ # version = [0_8_4, 1_2_0, 2_6_0, 3_4_0]
$ docker exec redmine_{version} /set_default.sh
```

### Start Each Redmine Service
手動で各 Redmine の Webサービスを起動する場合に実行する。

必要に応じて実行する。
```bash
$ # version = [0_8_4, 1_2_0, 2_6_0, 3_4_0]
$ docker exec redmine_{version} /start.sh
```

### Stop Sach Redmine Service
手動で各 Redmine の Webサービスを停止する場合に実行する。

必要に応じて実行する。
```bash
$ # version = [0_8_4, 1_2_0, 2_6_0, 3_4_0]
$ docker exec redmine_{version} /stop.sh
```
