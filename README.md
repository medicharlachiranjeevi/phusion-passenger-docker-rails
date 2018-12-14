# Passenger-Rails docker
Docker for hosting a Rails production app in Phusion Passenger running
#IN THE rubyenv FILE
 	give the ruby version 
#IN script.sh 
  give the github url

## Preparing the Rails application
Configure the production database in Rails (`config/database.yml`) such that the values are filled by environment variables. These variables will be set on start up of the container. The adapter and port defaults to Postgres.

    production:
        adapter: <%= ENV['APP_DB_ADAPTER'] || "postgresql" %>
        encoding: unicode
        pool: 5
        host: "postgres"
        port: <%= ENV['APP_DB_PORT'] || "5432" %>
        database: <%= ENV['APP_DB_DATABASE'] %>
        username: <%= ENV['APP_DB_USERNAME'] %>
        password: <%= ENV['APP_DB_PASSWORD'] %> 

##RUBY version
change in Dockerfile and startup.sh
##ENV

    change db-name,db-password,SECRET_KEY in .env file

    SECRET_KEY_BASE=3eaf1ffa19d5bfd3ac139af1f4c4b9f3;

    POSTGRES_DB=postgres

    POSTGRES_USER=postgres

    POSTGRES_PASSWORD=chiru

## Running your Rails application in Phusion Passenger

	docker-compose build

  	docker-compose up
#On start up the following actions will be executed:

	- database migrations

## Start up scripts

	Custom start up scripts can be added to `/ect/my_init.d` and will be executed during container start up.
## Place your rails app in fun folder
