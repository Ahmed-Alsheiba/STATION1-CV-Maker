Rails.application.routes.draw do
  # Canonical host: 301 www.station1.me → station1.me (apex), preserving path + query.
  # kamal-proxy can't redirect, so it's done here. Scoped to the `www` subdomain, so the apex
  # and the internal /up health check (non-www) are unaffected.
  match "(*any)", to: redirect { |_params, req| "https://station1.me#{req.fullpath}" },
        via: :all, constraints: { subdomain: "www" }

  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  root "pages#home"
  get 'examples', to: 'pages#examples'
  resources :forms

  # Health check for kamal-proxy (Rails 7.0 has no built-in /up). DB-free, returns 200.
  get "up", to: ->(_env) { [200, { "Content-Type" => "text/plain" }, ["OK"]] }
end
