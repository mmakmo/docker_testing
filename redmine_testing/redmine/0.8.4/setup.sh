#!/bin/bash

set -ue

rake db:migrate RAILS_ENV=production 1> /dev/null
