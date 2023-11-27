Rails.application.routes.draw do
  devise_for :users
  devise_for :guests

  root to: 'home#index'
  get 'search', to: 'search#results', as: 'search_results'
  get '/home/all/:city', to: 'home#all', as: 'all_home'

  authenticate :user do
    resources :inns, only: [:new, :create, :edit, :update]
    resources :rooms, only: [:new, :create, :show, :edit, :update] do
      resources :prices, only: [:new, :create, :show, :destroy]
      resources :reservations, only: [:show] do
        post 'checkin', on: :member
      end
    end
    resources :reservations, only: [:index]  
    get 'my_inn_reservations', to: 'inn_reservations#index', as: 'my_inn_reservations'
  end

  resources :inns, only: [:show, :index] do
    resources :rooms, only: [:show, :index] do
      resources :prices, only: [:show]
      resources :reservations, only: [:new, :create, :destroy] do
        get 'pre_save', on: :member
        get 'confirmation', on: :member
        get 'ready', on: :member
      end
    end
  end

  authenticate :guest do
    get 'my_reservations', to: 'reservations#my_reservations', as: 'my_reservations'
  end

  resources :cities, only: [] do
    get 'pousadas', to: 'cities#pousadas'
  end
end
