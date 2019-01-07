Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'welcome#index'
resources :trips, only: [:index, :show]
resources :trails, only: [:show, :index] do
  resources :watersources, only: [:index, :show]
end
namespace 'admin' do
  resources :trails, only: [:show, :edit, :destroy] do
    resources :watersources, shallow: true
  end
end
resources :users, only: [:create]
get '/register', to: 'users#new'
get '/login', to: 'sessions#new'
post '/login', to: 'sessions#create'

get '/profile', to: 'users#show'
end
