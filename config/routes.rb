Rails.application.routes.draw do  
  devise_for :users
  devise_for :visitor
  
  root to: 'home#index'  
  get 'search', to: 'search#results', as: 'search_results'
  get '/home/all/:city', to: 'home#all', as: 'all_home'

  authenticate :user do
    resources :inns, only: [:new, :create, :edit, :update]
    resources :rooms, only: [:new, :create, :edit, :update]     
  end

  resources :inns, only: [:show, :index] do
    resources :rooms
  end
  
  resources :rooms, only: [:show, :index] do    
    resources :reservations, only: [:new, :create] 
    resources :prices, only: [:new, :create, :destroy]
  end

  resources :cities, only: [] do   
    get 'pousadas', to: 'cities#pousadas'   
  end
  
end
