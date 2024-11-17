FROM ruby:2.5.1

ENV LANG=C.UTF-8

RUN gem install bundler -v 2.3.27

WORKDIR /app

COPY Gemfile Gemfile.lock /app/

RUN bundle install

COPY . /app

RUN bundle exec jekyll build

EXPOSE 4000

CMD ["bundle", "exec", "jekyll", "serve", "-P", "4000"]