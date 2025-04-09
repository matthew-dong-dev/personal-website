
# [Personal Website](https://www.matthewdong.dev) ![Worfklow badge](https://github.com/matthew-dong-dev/personal-website/actions/workflows/jekyll.yml/badge.svg)

## Local development

Option 1: Install docker and run with `docker build -t personal-website:1.0.0 .` and `docker run -p 4000:4000 personal-website:1.0.0`

Option 2 (better for local dev): Install ruby with rbenv and install bundler (see versions in Dockerfile).  Launch app with `bundle exec jekyll serve --config _config.yml,_config-dev.yml` 

Tests can be run manually with `bundle exec rake test`

Notes: 

- when updating dependencies, may need to delete gemfile.lock before rerunning `bundle install`
- See [wiki](https://github.com/matthew-dong-dev/personal-website/wiki) for other misc notes

## Build & Deployment

App is tested, built, and deployed via github workflows (see .github/workflows/ruby.yml and .github/workflows/jekyll.yml)

## UI Credits

[Website template](https://github.com/sergiokopplin/indigo)
