Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :chatrooms, only: [:show, :index] do
    resources :messages, only: :create
  end
  resources :books, only: %i[show] do
    resources :book_reviews, only: [:create]
  end
  resources :requests, only: [:destroy, :update]
  get 'pages/about_us', to: 'pages#about_us'
  get 'pages/faq', to: 'pages#faq'
  get 'requests/dashboard', to: 'requests#dashboard', as: 'dashboard'
  resources :users do
    resources :catalog_items, only: [:index]
  end
  resources :catalog_items, only: [:new, :create] do
    resources :requests, only: [:create, :new]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
