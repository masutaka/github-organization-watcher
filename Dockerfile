FROM ruby:2.7.2-alpine
LABEL maintainer "masutaka.net@gmail.com"

ENV BUILD_DEPENDENCIES="build-base postgresql-dev"

RUN apk add --update --no-cache $BUILD_DEPENDENCIES postgresql-libs nodejs tzdata

ENV BUNDLE_JOBS=4 \
    BUNDLE_RETRY=3

WORKDIR /app
COPY Gemfile Gemfile.lock /app/
