Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'dashboard', to: 'pages#dashboard'

  root 'products#index'

  resources :products, only: [:show, :index]

  put 'products/autocomplete', to: 'products#autocomplete'


end
