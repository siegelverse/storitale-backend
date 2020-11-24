Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/login', to: 'users#login'
  get '/profile', to: 'users#get_user'
  resources :users
  resources :reviews
  resources :stories
  resources :genres
  resources :likes
end
