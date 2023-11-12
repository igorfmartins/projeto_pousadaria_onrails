# config/routes.rb
Rails.application.routes.draw do
  devise_for :visitors
  devise_for :users
  
  root to: 'home#index'

  resources :users do
    member do
      get 'register_inn'
    end
  end  
  
  resources :inns, only: [:show]
  resources :rooms, only: [:show]  
  resources :prices
  resources :visitors


  authenticate :user do
    resources :inns, only: [:new, :create, :edit, :update]
    resources :rooms, only: [:new, :create, :edit, :update]
  end  
  
  resources :inns do
    resources :rooms
  end

  resources :rooms do
    resources :prices, only: [:new, :create]
  end
  


end

