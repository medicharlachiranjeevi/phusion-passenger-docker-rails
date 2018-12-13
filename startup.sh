#!/bin/bash
cd /home/app/webapp
bash -lc 'rvm --default use ruby-2.4.1'
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:migrate:status
