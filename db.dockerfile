FROM postgres:11.4-alpine
MAINTAINER Marnen Laibow-Koser <marnen@marnen.org>

COPY ./docker-entrypoint-initdb.d/* /docker-entrypoint-initdb.d/
