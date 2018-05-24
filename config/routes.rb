Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :articles
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks", registrations: 'users/registrations' }
  resources :articles
  resources :accounts, only: [:show, :edit, :update]
  root "articles#index"
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
