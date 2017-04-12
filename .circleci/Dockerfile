FROM ruby:2.4.0-alpine
LABEL maintainer "masutaka.net@gmail.com"

ENV BUILD_DEPENDENCIES="build-base postgresql-dev"

RUN apk add --update --no-cache $BUILD_DEPENDENCIES postgresql-libs nodejs tzdata
