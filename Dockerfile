FROM ruby:3.1.2-alpine3.15 AS builder

ENV APP_ROOT /app
ENV LANG C.UTF-8

RUN apk add --update --no-cache build-base

WORKDIR $APP_ROOT
ADD Gemfile* ./

RUN bundle install && \
    rm -rf /usr/local/bundle/*/*/cache && \
    find /usr/local/bundle -name "*.c" -delete && \
    find /usr/local/bundle -name "*.o" -delete

#################################################

FROM ruby:3.1.2-alpine3.15

WORKDIR $APP_ROOT

COPY --from=builder /usr/local/bundle/ /usr/local/bundle/

RUN addgroup ruby -g 3000 && adduser -D -h /home/ruby -u 3000 -G ruby ruby

USER ruby
