#!/bin/bash

set -ue

echo "Creating docker images"
docker-compose build 1> /dev/null

echo "Starting docker containers"
docker-compose up -d

while [[ -z `docker ps | grep redmine_mysql_5_6` ]]; do
  sleep 1s
done
# wait for MySQL service
echo "Waiting for MySQL service becomes ready"
sleep 20s

echo "Setup redmine 0.8.4 container"
docker exec redmine_0_8_4 /setup.sh
docker exec redmine_0_8_4 /set_default.sh

#echo "Setup redmine 1.2.0 container"
#docker exec redmine_1_2_0 /setup.sh

# echo "Setup redmine 2.6.0 container"
# docker exec redmine_2_6_0 /setup.sh

# echo "Setup redmine 3.4.0 container"
# docker exec redmine_3_4_0 /setup.sh

echo "Completed setup"

echo "Start redmine services"
./start.sh
