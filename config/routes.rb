Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :books, only: [:show]
  resources :users do
    resources :catalog_items, only: [:index]
  end
  resources :catalog_items do
    resources :requests, only: [:create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
