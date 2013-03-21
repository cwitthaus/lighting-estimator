LightingEstimator::Application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  match '/signup',  to: 'users#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

  resources :bulb
  resources :estimate do
    resources :replacement, only: [:create, :destroy]
  end


  root :to => "sessions#new"

  match '/bulbs', to: "bulb#index" 
  match '/signup',  to: 'users#new'
  match '/new_estimate', to: 'estimate#new'
  match '/show_estimate', to: 'estimate#show'
end