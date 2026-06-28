# syntax = docker/dockerfile:1
# Production image for STATION1 (Rails 7.0.8), deployed with Kamal 2 to an arm64 Raspberry Pi.
# Build on Apple Silicon (linux/arm64 natively) and push to GHCR; the Pi pulls and runs it.

ARG RUBY_VERSION=3.4.6
FROM docker.io/library/ruby:$RUBY_VERSION-slim AS base
WORKDIR /rails
ENV RAILS_ENV=production \
    BUNDLE_DEPLOYMENT=1 \
    BUNDLE_PATH=/usr/local/bundle \
    BUNDLE_WITHOUT=development:test \
    RAILS_SERVE_STATIC_FILES=true

# Runtime packages only (libpq for the pg gem; psql for ad-hoc db tasks via `kamal app exec`).
RUN apt-get update -qq && apt-get install -y --no-install-recommends \
    curl libpq5 postgresql-client && rm -rf /var/lib/apt/lists/*

# ---- build stage ----------------------------------------------------------
FROM base AS build
RUN apt-get update -qq && apt-get install -y --no-install-recommends \
    build-essential git libpq-dev libyaml-dev pkg-config && rm -rf /var/lib/apt/lists/*

# Match Gemfile.lock's "BUNDLED WITH" so bundle doesn't refuse to run.
RUN gem install bundler -v 2.7.2

COPY Gemfile Gemfile.lock ./
RUN bundle install && rm -rf ~/.bundle/ "${BUNDLE_PATH}"/ruby/*/cache

COPY . .
RUN chmod +x bin/docker-entrypoint

# Rails 7.0: use a dummy SECRET_KEY_BASE (there is no SECRET_KEY_BASE_DUMMY before 7.1).
# No DB or master key is needed to precompile assets (tailwindcss-rails + dartsass-rails).
RUN SECRET_KEY_BASE=dummy bundle exec rails assets:precompile

# ---- final stage ----------------------------------------------------------
FROM base
COPY --from=build /usr/local/bundle /usr/local/bundle
COPY --from=build /rails /rails

# Ensure writable dirs exist, then run as a non-root user (cannot bind :80, hence Puma :3000).
RUN mkdir -p log tmp tmp/pids storage && \
    useradd rails --create-home --shell /bin/bash && \
    chown -R rails:rails /rails
USER rails:rails

ENTRYPOINT ["/rails/bin/docker-entrypoint"]
EXPOSE 3000
CMD ["bundle", "exec", "puma", "-p", "3000"]
