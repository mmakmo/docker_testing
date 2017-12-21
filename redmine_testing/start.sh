!#/bin/bash
nohup docker-compose start &
docker exec redmine nohup ruby /opt/redmine/script/server webrick -e production > /dev/null &
