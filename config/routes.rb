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

  authenticate :user do
    resources :inns, only: [:new, :create, :edit, :update]
  end

  authenticate :user do
    resources :inns, only: [:show]
    resources :rooms, only: [:show]
  end

  resources :inns do
    resources :rooms
  end

end

