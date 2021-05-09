Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :books, only: %i[show new create]
  resources :users do
    resources :catalog_items, only: [:index]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
