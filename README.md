# Passenger-Rails docker
Docker for hosting a Rails production app in Phusion Passenger running Ruby 2.1

## Preparing the Rails application
Configure the production database in Rails (`config/database.yml`) such that the values are filled by environment variables. These variables will be set on start up of the container. The adapter and port defaults to Postgres.

    production:
        adapter: <%= ENV['APP_DB_ADAPTER'] || "postgresql" %>
        encoding: unicode
        pool: 5
        host: "database"
        port: <%= ENV['APP_DB_PORT'] || "5432" %>
        database: <%= ENV['APP_DB_DATABASE'] %>
        username: <%= ENV['APP_DB_USERNAME'] %>
        password: <%= ENV['APP_DB_PASSWORD'] %> 

## Running your Rails application in Phusion Passenger

    docker run --name my-rails-app \
           --volume /path/to/rails/app:/home/app/webapp \
           --link my-database-container:database \
           -e "SECRET_KEY_BASE=my-secret-production-key-for-rails" \
           -e "APP_DB_DATABASE=rails_db" -e "APP_DB_USERNAME=rails_db_user" -e "APP_DB_PASSWORD=rails_db_password" \
           -d erikap/passenger-rails

On start up the following actions will be executed:
- bundle install
- assets precompilation
- database migrations

## Start up scripts
Custom start up scripts can be added to `/ect/my_init.d` and will be executed during container start up.