FROM ruby:2.6.5-alpine3.11

ENV APP_ROOT /app
ENV LANG C.UTF-8

WORKDIR $APP_ROOT

ADD Gemfile* ./

RUN gem update --system && \
    gem install bundler && \
    bundle install
