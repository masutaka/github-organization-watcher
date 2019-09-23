# GitHub Organization Watcher

[![CircleCI Status](https://img.shields.io/circleci/build/github/masutaka/github-organization-watcher?logo=circleci&style=flat)][circleci]

[circleci]: https://circleci.com/gh/masutaka/github-organization-watcher

## Requirements

* Docker

## Setup

    $ cp .env.skeleton .env

Replace the value of the environment variables in `.env`.

    $ ./bin/setup

## Start

    $ docker-compose up

Visit http://localhost:13000

## Test

    $ docker-compose run --rm app rake spec

## Recommendation

### RuboCop

    $ docker-compose run --rm app rubocop

Also tests in CI.

### Rails Best Practices

You can check whether this is Rails Best Practices. Also tests in CI.

    $ docker-compose run --rm app rails_best_practices .

## Heroku

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)
