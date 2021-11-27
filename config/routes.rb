Rails.application.routes.draw do
  root 'users#index'
  resources :users
  resources :sessions, only: %i[new create destroy]
  resources :questions, except: %i[show new index]

  get 'sign_up', to: 'users#new'
  get 'log_out', to: 'sessions#destroy'
  get 'log_in', to: 'sessions#new'
end
