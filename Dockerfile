FROM ruby:2.6.3-alpine
RUN apk --no-cache add build-base git nodejs postgresql-dev tzdata

ARG workdir=/erogatio
ARG rails_port=3000

COPY docker-entrypoint-bundler.sh /
ENTRYPOINT ["/docker-entrypoint-bundler.sh"]
ENV BUNDLE_PATH=/bundle
ENV BUNDLE_BIN=/bundle/bin
ENV GEM_HOME=/bundle
ENV PATH="${BUNDLE_BIN}:${PATH}"

WORKDIR ${workdir}
COPY . ${workdir}/

EXPOSE ${rails_port}
ENV PORT ${rails_port}
