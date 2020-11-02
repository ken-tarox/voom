Rails.application.routes.draw do
  root   'static_pages#home'
  get    '/signup',  to: 'users#new'
  get    '/onsenposts',    to: 'onsenposts#index'
  get    '/onsenposts/:id',    to: 'onsenposts#show'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users do
   get    '/my_onsenposts',    to: 'users#my_onsenposts'
   get    '/bookmarked_onsenposts',    to: 'users#bookmarked_onsenposts'
  end
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :onsenposts,          only: [:create, :destroy]
  resources :onsenposts, shallow: true do
  resource  :bookmarks, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
  end
end
