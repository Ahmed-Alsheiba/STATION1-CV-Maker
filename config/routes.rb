Rails.application.routes.draw do
  devise_for :users

  root "pages#home"
  get "forms/new", to: "forms#new"
end
