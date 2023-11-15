Rails.application.routes.draw do  
  devise_for :users
  
  root to: 'home#index'

  authenticate :user do
    resources :inns, only: [:new, :create, :edit, :update]
    resources :rooms, only: [:new, :create, :edit, :update]
  end

  resources :inns, only: [:show, :index] do
    resources :rooms
  end
  
  resources :rooms, only: [:show, :index] do
    resources :prices, only: [:new, :create, :destroy]
  end

  resources :cities, only: [] do   
    get 'pousadas', to: 'cities#pousadas'
    get ':city', to: 'home#all'
  end
  
end
