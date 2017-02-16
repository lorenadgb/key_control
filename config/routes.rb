Rails.application.routes.draw do
  resources :keys
  resources :addresses
  resources :owners
  resources :buildings
end
