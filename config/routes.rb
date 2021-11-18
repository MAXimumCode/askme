Rails.application.routes.draw do
  root 'users#index'
  resources :users
  resources :questions
  get 'show' => 'users#show'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
