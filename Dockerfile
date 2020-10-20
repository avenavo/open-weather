FROM ruby:2.7.2

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /open-weather-api
WORKDIR /open-weather-api

COPY Gemfile /open-weather-api/Gemfile
COPY Gemfile.lock /open-weather-api/Gemfile.lock
RUN bundle install

COPY . /open-weather-api
EXPOSE 3000
