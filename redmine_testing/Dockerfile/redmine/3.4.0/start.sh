#!/bin/bash

gosu redmine nohup bundle exec rails server -b 0.0.0.0 webrick -e production 1> /dev/null 2> /opt/redmine/log/error.log &
