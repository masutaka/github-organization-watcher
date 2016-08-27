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

You can execute [rubocop](https://rubygems.org/gems/rubocop) using [pre-commit](https://rubygems.org/gems/pre-commit) by a commit.

    $ bundle exec pre-commit install
    $ git config pre-commit.ruby 'bundle exec ruby'

Also checks at CI.

### Rails Best Practices

You can check whether this is Rails Best Practices. Also checks at CI.

    $ bundle exec rails_best_practices .

## Heroku

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

[circleci-badge]: https://circleci.com/gh/masutaka/github-organization-watcher/tree/master.svg?style=svg
[circleci-link]: https://circleci.com/gh/masutaka/github-organization-watcher/tree/master
