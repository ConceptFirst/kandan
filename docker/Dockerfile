FROM ubuntu:14.04

RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y --no-install-recommends build-essential nodejs ruby1.9 git curl vim zsh
RUN apt-get install -y --no-install-recommends ruby1.9.1-dev ruby-bundler libxslt-dev libxml2-dev libpq-dev libsqlite3-dev
RUN gem i bundler && bundle config jobs 4

# prebuild gems for speed
ADD https://raw.githubusercontent.com/kandanapp/kandan/master/Gemfile /tmp/Gemfile
ADD https://raw.githubusercontent.com/kandanapp/kandan/master/Gemfile.lock /tmp/Gemfile.lock
RUN bundle --gemfile /tmp/Gemfile
