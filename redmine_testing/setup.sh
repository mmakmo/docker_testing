#!/bin/bash
docker-compose up --build -d
#docker exec redmine rake db:migrate RAILS_ENV="production" &
#docker exec redmine rake redmine:load_default_data RAILS_ENV="production" &
