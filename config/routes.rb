Rails.application.routes.draw do
  resources :themes
  root to: 'pages#home'

  devise_for :users

  resources :photos
  resources :users, only: [:show]
  resources :profiles, only: [:new, :edit, :create, :update]

  resources :rooms do
    resources :bookings, only: [:create]
  end
end
