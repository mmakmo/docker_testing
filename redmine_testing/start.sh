#!/bin/bash

set -ue

docker-compose start

while [[ -z `docker ps | grep redmine_mysql_5_6` ]]; do
  sleep 1s
done
# wait for MySQL service
echo "Waiting for MySQL service becomes ready."
sleep 20s

docker exec redmine_0_8_4 /start.sh 1> /dev/null &
echo "Redmine 0.8.4 started."
# docker exec redmine_1_2_0 /start.sh 1> /dev/null &
# echo "Redmine 1.2.0 started."
# docker exec redmine_2_6_0 /start.sh 1> /dev/null &
# echo "Redmine 2.6.0 started."
# docker exec redmine_3_4_0 /start.sh 1> /dev/null &
# echo "Redmine 3.4.0 started."
