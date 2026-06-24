# Puma can serve each request in a thread from an internal thread pool.
# The `threads` method setting takes two numbers: a minimum and maximum.
# Any libraries that use thread pools should be configured to match
# the maximum value specified for Puma. Default is set to 5 threads for minimum
# and maximum; this matches the default thread size of Active Record.
#
max_threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
min_threads_count = ENV.fetch("RAILS_MIN_THREADS") { max_threads_count }
threads min_threads_count, max_threads_count

# Specifies the `worker_timeout` threshold that Puma will use to wait before
# terminating a worker in development environments.
#
worker_timeout 3600 if ENV.fetch("RAILS_ENV", "development") == "development"

# Specifies the `port` that Puma will listen on to receive requests; default is 3000.
# Skipped in production where PUMA_SOCKET is set, so Puma listens ONLY on the unix
# socket and is never exposed on a TCP port.
#
port ENV.fetch("PORT") { 3000 } unless ENV["PUMA_SOCKET"]

# In production, bind to a unix socket that Nginx proxies to (keeps Puma off the
# network entirely). When PUMA_SOCKET is unset (dev), the TCP `port` above is used.
bind "unix://#{ENV['PUMA_SOCKET']}" if ENV["PUMA_SOCKET"]

# Specifies the `environment` that Puma will run in.
#
environment ENV.fetch("RAILS_ENV") { "development" }

# Specifies the `pidfile` that Puma will use.
pidfile ENV.fetch("PIDFILE") { "tmp/pids/server.pid" }

# Specifies the number of `workers` to boot in clustered mode.
# Workers are forked web server processes. If using threads and workers together
# the concurrency of the application would be max `threads` * `workers`.
# Workers do not work on JRuby or Windows (both of which do not support
# processes).
#
# Defaults to 0 (single mode) so development is unchanged; production sets WEB_CONCURRENCY.
workers ENV.fetch("WEB_CONCURRENCY") { 0 }.to_i

# Use the `preload_app!` method when specifying a `workers` number.
# This directive tells Puma to first boot the application and load code
# before forking the application. This takes advantage of Copy On Write
# process behavior so workers use less memory. Only preload in clustered mode.
preload_app! if ENV["WEB_CONCURRENCY"]

# Allow puma to be restarted by `bin/rails restart` command.
plugin :tmp_restart
