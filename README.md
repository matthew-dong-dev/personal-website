<p>
    <h2><a href="https://www.matthewdong.dev">Personal Website</a> · <img src="https://travis-ci.org/mdong127/mdong127.github.io.svg?branch=master" alt="Build Status" style="max-width:100%;"></a></h2>
</p>

## Local development

Option 1: Install docker and run with `docker build -t personal-website:1.0.0 .` and `docker run -p 4000:4000 personal-website:1.0.0`

Option 2 (better for local dev): Install ruby with rbenv and install bundler (see versions in Dockerfile).  Launch app with `bundle exec jekyll serve --config _config.yml,_config-dev.yml` 

Notes: 

- when updating dependencies, may need to delete gemfile.lock before rerunning `bundle install`
- See [wiki](https://github.com/matthew-dong-dev/personal-website/wiki) for other misc notes

## Build & Deployment

App is deployed via a github workflow (see .github/workflows/jekyll.yml)

[Website template](https://github.com/sergiokopplin/indigo)