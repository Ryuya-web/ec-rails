FROM ruby:2.5.8
RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y postgresql-client --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

WORKDIR /ec6

ADD Gemfile /ec6/Gemfile
ADD Gemfile.lock /ec6/Gemfile.lock

RUN gem install bundler
RUN bundle install

ADD . /ec6