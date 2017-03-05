Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  root 'pages#index'

  resources :real_state_agencies, except: :destroy
  resources :keys
  resources :addresses
  resources :people
  resources :buildings
end
