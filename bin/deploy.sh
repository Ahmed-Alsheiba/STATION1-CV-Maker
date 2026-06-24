#!/usr/bin/env bash
# In-place production deploy for STATION1. Run on the server after pushing code:
#   /var/www/station1/current/bin/deploy.sh
set -euo pipefail

APP_DIR=/var/www/station1/current
ENV_FILE=/var/www/station1/shared/.env

cd "$APP_DIR"

# Load production env (RAILS_MASTER_KEY, DATABASE_URL, etc.) so the rails
# commands below have what they need when run by hand.
set -a
# shellcheck disable=SC1090
source "$ENV_FILE"
set +a

echo "==> Pulling latest code"
git pull --ff-only

echo "==> Installing gems"
bundle config set --local without 'development test'
bundle install

echo "==> Precompiling assets (Tailwind + Dartsass + sprockets)"
bundle exec rails assets:precompile

echo "==> Running migrations"
bundle exec rails db:migrate

echo "==> Restarting Puma"
sudo systemctl restart station1

echo "==> Deployed $(git rev-parse --short HEAD)"
