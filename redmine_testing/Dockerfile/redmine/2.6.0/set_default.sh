#!/bin/bash

RAILS_ENV=production REDMINE_LANG=ja bundle exec rake redmine:load_default_data > /dev/null
