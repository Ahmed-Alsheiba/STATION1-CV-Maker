Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  root "pages#home"
  get 'examples', to: 'pages#examples'
  resources :forms

  # Health check for kamal-proxy (Rails 7.0 has no built-in /up). DB-free, returns 200.
  get "up", to: ->(_env) { [200, { "Content-Type" => "text/plain" }, ["OK"]] }
end
