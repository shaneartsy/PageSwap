Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'pages/about_us', to: 'pages#about_us'
  get 'pages/faq', to: 'pages#faq'
  resources :books, only: [:show]
  resources :users do
    resources :catalog_items, only: [:index]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
