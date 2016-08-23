Rails.application.routes.draw do
  get 'movies/index'

  get 'movies/show'

  resource :session, :only => [:new, :create, :destroy]
  get "login" => "sessions#new"
  delete "logout" => "sessions#destroy"
  get 'logout' => "sessions#destroy"

  resources :users
  resources :movies

  root "users#new"

  get '*path' => redirect("/")
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
