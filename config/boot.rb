ENV["BUNDLE_GEMFILE"] ||= File.expand_path("../Gemfile", __dir__)

require "bundler/setup" # Set up gems listed in the Gemfile.
require "logger" #fix concurrent-ruby issue with ruby 3.4.6
require "bootsnap/setup" # Speed up boot time by caching expensive operations.
