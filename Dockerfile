FROM public.ecr.aws/citizensadvice/ruby:3.0.1-alpine3.12

ENV APP_ROOT /app
ENV LANG C.UTF-8

WORKDIR $APP_ROOT

ADD Gemfile* ./

RUN gem install bundler
RUN bundle install
