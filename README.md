# GitHub Organization Watcher [![CircleCI Badge][circleci-badge]][circleci-link]

## Requirements

* Ruby-2.3.x
* PostgreSQL-9.5.x

## Setup

    $ ./bin/setup

## Start

    $ ./bin/rails s

## Test

    $ rake spec

## Recommendation

You can execute [rubocop](https://rubygems.org/gems/rubocop) using [pre-commit](https://rubygems.org/gems/pre-commit) by a commit.

    $ bundle exec pre-commit install
    $ git config pre-commit.ruby 'bundle exec ruby'

## Heroku

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

[circleci-badge]: https://circleci.com/gh/masutaka/github-organization-watcher/tree/master.svg?style=svg
[circleci-link]: https://circleci.com/gh/masutaka/github-organization-watcher/tree/master
