# config/routes.rb
Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  resources :users do
    member do
      get 'register_inn'
    end
  end

  resources :inns do
    resources :rooms
  end

  authenticate :user do
    resources :owners, only: [:index, :new, :create, :show]
  end
end

