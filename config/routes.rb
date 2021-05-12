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
  get 'requests/pending_swaps', to: 'requests#pending_swaps', as: 'pending_swaps'
  get 'requests/accepted_swaps', to: 'requests#accepted_swaps', as: 'accepted_swaps'
  get 'requests/declined_swaps', to: 'requests#declined_swaps', as: 'declined_swaps'
  get 'requests/past_swaps', to: 'requests#past_swaps', as: 'past_swaps'
  get 'catalog_items/my_books', to: 'catalog_items#my_books', as: 'my_books'
  resources :users do
    resources :catalog_items, only: [:index]
  end
  resources :catalog_items, only: [:new, :create] do
    resources :requests, only: [:create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
