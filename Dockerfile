# See https://intercityup.com/blog/how-i-build-a-docker-image-for-my-rails-app.html
# See https://intercityup.com/blog/deploy-rails-app-including-database-configuration-env-vars-assets-using-docker.html

FROM phusion/passenger-full
# Set correct environment variables.
ENV HOME /root
ENV RAILS_ENV production
RUN apt update
RUN apt install -y sudo
RUN apt-get install -y tzdata
RUN sudo apt-get install -y build-essential libcurl4-openssl-dev
# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]
COPY rubyenv /root/
RUN bash /root/rubyenv
# Start Nginx / Passenger
RUN rm -f /etc/service/nginx/down
# Remove the default site
RUN rm /etc/nginx/sites-enabled/default

# Add the nginx info
ADD nginx.conf /etc/nginx/sites-enabled/webapp.conf

# Add the rails-env configuration file so Nginx preserves the environment variables listed
ADD rails-env.conf /etc/nginx/main.d/rails-env.conf

# Prepare folders
RUN mkdir /home/app/webapp
WORKDIR /home/app/webapp
# Add startup script to run during container startup
RUN mkdir -p /etc/my_init.d
ADD startup.sh /etc/my_init.d/startup.sh
RUN chmod +x /etc/my_init.d/*.sh
RUN apt-get install git
# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN ls
copy script.sh /home/app/
RUN bash /home/app/script.sh
#RUN bundle install
COPY ./database.yml /home/app/webapp/config
RUN chown -R app:app /home/app/webapp
RUN ls /home/app/webapp/
RUN sudo -u app bundle install --deployment --without development test
RUN sudo -u app  RAILS_ENV=production bundle exec rake assets:precompile
RUN gem install tzinfo-data

