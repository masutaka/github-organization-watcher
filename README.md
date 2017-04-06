# GitHub Organization Watcher [![CircleCI Badge][circleci-badge]][circleci-link]

## Requirements

* Docker

## Setup

    $ cp .env.skeleton .env

Replace the value of the environment variables in `.env`.

    $ ./bin/setup

## Start

    $ docker-compose up

## Test

    $ docker-compose run app rake spec

## Recommendation

### RuboCop

Checks at CI.

### Rails Best Practices

You can check whether this is Rails Best Practices. Also checks at CI.

    $ docker-compose run app rails_best_practices .

## Heroku

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

[circleci-badge]: https://circleci.com/gh/masutaka/github-organization-watcher/tree/master.svg?style=svg
[circleci-link]: https://circleci.com/gh/masutaka/github-organization-watcher/tree/master
