# Passenger-Rails docker
# For production
## Docker for hosting a Rails production app in Phusion Passenger running
 	git clone https://github.com/medicharlachiranjeevi/phusion-passenger-docker-rails.git
## prerequisites must install docker and docker-compose
### for Docker https://docs.docker.com/v17.12/install/
### for Docker-compose https://docs.docker.com/compose/install/#upgrading

# ENV in .env
    GIT_URL=https://<user>:<password>@<gitserver>/<path>/<repo>.git

    RUBY_VER=2.0.0

    change db-name,db-password,SECRET_KEY in .env file

    SECRET_KEY_BASE=3eaf1ffa19d5bfd3ac139af1f4c4b9f3;

    POSTGRES_DB=postgres

    POSTGRES_USER=postgres

    POSTGRES_PASSWORD=chiru

## Running your Rails application in Phusion Passenger

	docker-compose build

  	docker-compose up -d
#On start up the following actions will be executed:

	- database migrations
        - databse seeds

## Start up scripts

	Custom start up scripts can be added to `/ect/my_init.d` and will be executed during container start up.
## For development of rails app in the rails app folder run commands

	  curl -o .env https://raw.githubusercontent.com/medicharlachiranjeevi/phusion-passenger-docker-rails/master/.env

	  curl -o  script https://raw.githubusercontent.com/medicharlachiranjeevi/phusion-passenger-docker-rails/master/script

	  curl -o devdocker-compose.yaml https://raw.githubusercontent.com/medicharlachiranjeevi/phusion-passenger-docker-rails/master/devdocker-compose.yaml
          
          curl -o database.yml https://raw.githubusercontent.com/medicharlachiranjeevi/phusion-passenger-docker-rails/master/database.yml

#  Run the command

 	bash script
# For bunlde install

	docker-compose exec web bunlde

# For db:migrations 

      docker-compose exec web rake db:migrate
#For logs

  	docker-compose logs web
