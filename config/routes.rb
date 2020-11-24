Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
    post '/login', to: 'users#log_in'
    get '/profile', to: 'users#get_user'
  resources :reviews
  resources :stories
  resources :genres
  resources :likes
end
