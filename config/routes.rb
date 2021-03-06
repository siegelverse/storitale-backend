Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/login', to: 'auth#create'
  get '/profile', to: 'users#get_user'

  resources :users do 
    resource :follow, only: [:show, :create, :destroy]
  end 

  resources :stories do 
    resource :favorite, only: [:create, :destroy]
    resources :reviews, only: [:create, :index, :destroy]
  end 
  
  resources :tags, only: [:index]
end
