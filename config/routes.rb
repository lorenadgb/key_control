Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }, :skip => :registrations
  root 'pages#index'

  resources :real_state_agencies, except: :destroy
  resources :keys, except: :new
  resources :addresses
  resources :people
  resources :buildings
  resources :visits
end
