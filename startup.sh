#!/bin/bash
cd /home/app/webapp
bash -lc 'rvm --default use ruby-2.0.0'
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:migrate:status
