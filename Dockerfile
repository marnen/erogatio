FROM ruby:2.6.3-alpine

RUN apk --no-cache add build-base nodejs postgresql-dev

ARG workdir=/erogatio

WORKDIR ${workdir}

COPY Gemfile* ${workdir}/
RUN bundle install
