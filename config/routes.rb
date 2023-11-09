Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  resources :inns do
    resources :rooms
  end

  authenticate :user do
    resources :owners, only: [:index, :new, :create, :show]
  end
end
