FROM ruby:2.4.1

ENV APP_HOME /var/www
ENV BUNDLE_PATH /bundle/ruby/2.4.1
ENV BUNDLE_TIMEOUT 30
ENV RAILS_DEV_DB db/publisher_db.sqlite3

RUN apt-get update -qq && apt-get install -y build-essential vim
RUN apt-get install -y mysql-client
RUN apt-get install -y nodejs

RUN rm -rf /var/lib/apt/lists/*
RUN rm -rf ~/.bundle

RUN mkdir $APP_HOME
WORKDIR $APP_HOME

EXPOSE 3000

CMD ["bin/rails", "server", "-b", "0.0.0.0", "-P", "tmp/pids/publisher.pid"]
