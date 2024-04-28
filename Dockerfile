FROM ruby:3.3.0

RUN apt-get update && apt-get install -y wget less groff
RUN apt-get update -qq && apt-get install -y build-essential libsnappy-dev libpq-dev cron libicu-dev git
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV APP_HOME=/app \
    RAILS_ENV=production

RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile Gemfile.lock $APP_HOME/
RUN bundle install --jobs 20 --retry 5

ADD . $APP_HOME/

EXPOSE 3000
CMD bundle exec rails s
