#!/bin/bash

set -ue

bundle exec rake generate_secret_token 1> /dev/null
RAILS_ENV=production bundle exec rake db:migrate 1> /dev/null
