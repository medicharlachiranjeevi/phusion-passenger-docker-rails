# Passenger-Rails docker
Docker for hosting a Rails production app in Phusion Passenger running
# IN THE rubyenv FILE
	give the ruby version
# IN script.sh
	give the github url
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
