FROM ruby:3.1.1

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client libvips imagemagick && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

CMD ["rails", "server", "-b", "0.0.0.0"]