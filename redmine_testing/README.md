# redmine_testing

## System
Docker compose を使用しました。Redmineのちょっとしたこと確認用なので、とりあえず動く物を用意しています。

* redmine 0.8.4 on CentOS 6 (container name: redmine)
  - Exposed port#: 80
* MySQL 5.6 (container name: redmine_mysql)
  - Exposed port#: 3306
  - root user ac/pw: root/password
  - redmine user ac/pw: redmine/redmine


## Usage
### Setup containers
初回もしくは `docker-compose down` を実行したあとの場合に必要。

```bash
$ docker-compose up > /dev/null &
```
上のコマンドが終わったら続けてこれを実行する。
```bash
$ ./initialize_redmine.sh
...
[2017-12-22 23:39:42] INFO  WEBrick 1.3.1
[2017-12-22 23:39:42] INFO  ruby 1.8.7 (2013-06-27) [x86_64-linux]
[2017-12-22 23:39:42] INFO  WEBrick::HTTPServer#start: pid=16 port=3000
$
```

### Access Redmine
* for Windows(useing Docker Toolbox): `http://192.168.99.100/`
* for Linux or Mac: `http://localhost/`

* Redmine login username / password: `admin` / `admin`


### Start containers
最初のコンテナ作成時以降、コンテナを起動したい場合に実行する。
```bash
$ ./start.sh
```

### Stop containers
```bash
$ docker-compose stop
```

### Shutdown containers
```bash
$ docker-compose down
```
