FROM ruby:2.6.3-alpine
RUN apk --no-cache add build-base nodejs postgresql-dev tzdata

ARG workdir=/erogatio
ARG rails_port=3000
ARG local_bundle_path=vendor/bundle
ARG bundle_path=${workdir}/${local_bundle_path}
WORKDIR ${workdir}

ENV BUNDLE_PATH ${bundle_path}
COPY ${local_bundle_path} ${bundle_path}/
RUN ls ${bundle_path}
COPY Gemfile* ${workdir}/
RUN bundle config
RUN bundle install
COPY . ${workdir}/
RUN ls -a ${workdir}/

EXPOSE ${rails_port}
ENV PORT ${rails_port}
