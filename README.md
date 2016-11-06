# GitHub Organization Watcher [![CircleCI Badge][circleci-badge]][circleci-link]

## Requirements

* Ruby-2.3.x
* PostgreSQL-9.5.x

## Setup

    $ ./bin/setup

## Start

    $ ./bin/rails s

## Test

    $ ./bin/rake spec

## Recommendation

### RuboCop

Checks at CI.

### Rails Best Practices

You can check whether this is Rails Best Practices. Also checks at CI.

    $ bundle exec rails_best_practices .

## Heroku

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

[circleci-badge]: https://circleci.com/gh/masutaka/github-organization-watcher/tree/master.svg?style=svg
[circleci-link]: https://circleci.com/gh/masutaka/github-organization-watcher/tree/master
