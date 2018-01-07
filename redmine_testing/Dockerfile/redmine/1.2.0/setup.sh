#!/bin/bash

set -ue

rake generate_session_store 1> /dev/null
rake db:migrate RAILS_ENV=production 1> /dev/null
