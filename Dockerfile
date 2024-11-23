FROM ruby:3.3.6

ENV LANG=C.UTF-8

RUN gem install bundler -v 2.5.23

WORKDIR /app

COPY Gemfile Gemfile.lock /app/

RUN bundle install

COPY . /app

RUN bundle exec jekyll build

EXPOSE 4000

CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]