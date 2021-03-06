Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create]
  resources :goals
  delete '/logout', to: 'sessions#destroy', as: :logout

  root to: 'home#index'
end
