source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.4.6"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.8"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# user authentication gem
gem 'devise', '~> 4.9', '>= 4.9.3'

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use Redis adapter to run Action Cable in production
gem "redis", "~> 4.0"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# bundler 3.0 prefers :windows platform to be specified like this
gem "tzinfo-data", platforms: %i[ windows ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# migrate from sass-rails to dartsass-rails
gem "dartsass-rails", "~> 0.5.1"

# postgresql gem
gem 'pg', '~> 1.5', '>= 1.5.6'

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  # bundler 3.0 prefers :windows platform to be specified like this
  gem "debug", platforms: %i[ windows ]
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"

end
# use Tailwind CSS framework
gem "tailwindcss-rails", "~> 2.4"

# gems below are added to avoid any errors or alerts after migrating from ruby 3.0.2 to ruby 3.4.6

# to fix concurrent-ruby issue with ruby 3.4.6
gem 'mutex_m'

gem "benchmark"
