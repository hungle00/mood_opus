# Make sure RUBY_VERSION matches the Ruby version in .ruby-version and Gemfile
ARG RUBY_VERSION=3.3.5
FROM ruby:$RUBY_VERSION-slim as base

RUN apt-get update -qq && apt-get install -yq --no-install-recommends \
    build-essential \
    gnupg2 \
    curl \
    less \
    git \
    libpq-dev \
    libvips \
    postgresql-client \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Add Node.js to sources list
RUN curl -sL https://deb.nodesource.com/setup_20.x | bash -

# Install Node.js version that will enable installation of yarn
RUN apt-get install -y --no-install-recommends \
    nodejs \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN npm install -g yarn

ENV LANG=C.UTF-8 \
  BUNDLE_JOBS=4 \
  BUNDLE_RETRY=3

RUN gem update --system && gem install bundler

# Use what the base image provides rather than create our own  app directory
WORKDIR /usr/src/app/

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

CMD ["bin/rails", "server", "-b", "0.0.0.0"]