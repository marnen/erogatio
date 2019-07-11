FROM ruby:2.6.3-alpine
RUN apk --no-cache add build-base git nodejs postgresql-dev tzdata

ARG workdir=/erogatio
ARG rails_port=3000

WORKDIR ${workdir}

COPY Gemfile* ${workdir}/
RUN bundle install

COPY . ${workdir}/

EXPOSE ${rails_port}
ENV PORT ${rails_port}
