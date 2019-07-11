FROM ruby:2.6.3-alpine

ARG workdir=/erogatio

WORKDIR ${workdir}

COPY Gemfile* ${workdir}/
RUN bundle install
