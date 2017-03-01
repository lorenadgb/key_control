Rails.application.routes.draw do
  root 'pages#index'

  resources :real_state_agencies
  resources :keys
  resources :addresses
  resources :people
  resources :buildings
end
