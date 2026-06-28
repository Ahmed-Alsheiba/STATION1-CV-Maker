module Middleware
  # Backport of Rails 7.1's ActionDispatch::AssumeSSL for this Rails 7.0 app.
  #
  # TLS is terminated upstream at the Cloudflare edge; kamal-proxy runs with ssl:false.
  # Telling Rails that every request arrived over HTTPS keeps `config.force_ssl = true`
  # from redirect-looping AND stops kamal-proxy's internal /up health check (a plain HTTP
  # request with no X-Forwarded-Proto) from being 301'd — which would fail the deploy.
  class AssumeSSL
    def initialize(app)
      @app = app
    end

    def call(env)
      env["HTTPS"] = "on"
      env["HTTP_X_FORWARDED_PORT"]  = "443"
      env["HTTP_X_FORWARDED_PROTO"] = "https"
      env["rack.url_scheme"]        = "https"
      @app.call(env)
    end
  end
end
