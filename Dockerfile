FROM ruby:2.3
WORKDIR /var/www/app


COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

CMD [ "rails", "s", "-b", "0.0.0.0" ]