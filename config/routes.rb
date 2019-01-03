Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'welcome#index'
resources :trips, only: [:index, :show]
resources :trails, only: [:show]
resources :users, only: [:create]
get '/register', to: 'users#new'
get '/login', to: 'sessions#new'
post '/login', to: 'sessions#create'

get '/profile', to: 'users#show'
end
