Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  get 'register', to: 'users#new'
  get 'login', to: 'users#new'
  post 'create', to: 'users#create'
  post 'sign_in', to: 'users#sign_in'
  get 'destroy', to: 'users#destroy'

  resources :documents
end
