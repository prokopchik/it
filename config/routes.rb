Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :articles
    resources :roles
    resources :comments
    resources :images

    root to: 'users#index'
  end

  resources :articles
  devise_for :users, controllers: { omniauth_callbacks: 'callbacks', registrations: 'users/registrations' }
  resources :articles do
    resources :images, only: [:create]
    resources :comments, only: [:create]
  end

  resources :accounts, only: %i[show edit update]
  root 'articles#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
