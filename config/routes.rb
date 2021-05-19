Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :chatrooms, only: [:index] do
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
  patch 'catalog_items/:id/make_mint', to: 'catalog_items#make_mint', as: 'make_mint'
  patch 'catalog_items/:id/make_near_mint', to: 'catalog_items#make_near_mint', as: 'make_near_mint'
  patch 'catalog_items/:id/make_good', to: 'catalog_items#make_good', as: 'make_good'
  patch 'catalog_items/:id/make_worn', to: 'catalog_items#make_worn', as: 'make_worn'
  patch 'catalog_items/:id/make_poor', to: 'catalog_items#make_poor', as: 'make_poor'
  patch 'requests/:id/accept', to: 'requests#accept', as: 'accept'
  patch 'requests/:id/decline', to: 'requests#decline', as: 'decline'
  patch 'requests/:id/complete', to: 'requests#complete', as: 'complete'
  patch 'catalog_items/:id/make_available', to: 'catalog_items#make_available', as: 'make_available'
  patch 'catalog_items/:id/make_unavailable', to: 'catalog_items#make_unavailable', as: 'make_unavailable'
  resources :users do
    resources :catalog_items, only: [:index]
  end
  get 'chatrooms/:id/show_room', to: 'chatrooms#show_room', as: 'show_room'
  get 'chatrooms/:user_id/show_room_user', to: 'chatrooms#show_user_room', as: 'user_room'
  resources :catalog_items, only: [:new, :create, :destroy] do
    resources :requests, only: [:create, :new]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
