Rails.application.routes.draw do
 
  root 'parks#index'

  resources :parks, only: [:index, :show]
  resources :trees, only: [:index, :show]
  resources :assets, only: [:index, :show]

  get 'search_trees', to: 'trees#search'
  get 'about', to: 'about#index'
  

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
