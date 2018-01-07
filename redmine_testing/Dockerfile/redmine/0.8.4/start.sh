#!/bin/bash

nohup ruby /opt/redmine/script/server webrick -e production 1> /dev/null 2> /opt/redmine/log/error.log &
