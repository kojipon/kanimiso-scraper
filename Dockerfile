FROM ruby:3.2-alpine

WORKDIR /app

RUN apk add --no-cache \
    build-base \
    chromium \
    chromium-chromedriver

COPY Gemfile* ./
RUN bundle install

COPY . .
