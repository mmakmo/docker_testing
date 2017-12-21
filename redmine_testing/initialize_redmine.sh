!#/bin/bash
docker exec redmine rake db:migrate RAILS_ENV="production"
docker exec redmine rake redmine:load_default_data RAILS_ENV="production"
docker exec redmine nohup ruby /opt/redmine/script/server webrick -e production > /dev/null &
