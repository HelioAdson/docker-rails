FROM ruby:2.7.1
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client netcat
WORKDIR /docker-rails
COPY Gemfile /docker-rails/Gemfile
COPY Gemfile.lock /docker-rails/Gemfile.lock
RUN bundle install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["bash", "entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
# CMD ["rails", "server", "-b", "0.0.0.0"]