# redmine_testing

## System
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

$
```

### Start containers
多分動く。
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
