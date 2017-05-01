Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }, :skip => :registrations
  root 'pages#index'

  resources :real_state_agencies, except: :destroy
  resources :keys, except: [:new, :show, :edit] do
    collection do
      get  'print' => 'keychains#print', via: :get
      post 'print' => 'keychains#print', via: :post
      get  'print_keychains' => 'keychains#print_keychains', via: :get
    end
  end
  resources :addresses
  resources :people
  resources :buildings, except: [:destroy] do
    collection do
      get 'disable/:id' => 'buildings#disable', as: 'disable'
      get 'enable/:id' => 'buildings#enable', as: 'enable'
    end
  end

  resources :visits

  get 'set_status_to_available' => 'keys#set_status_to_available', via: :get
  get 'update_keys'      => 'visits#update_keys', via: :get
end
