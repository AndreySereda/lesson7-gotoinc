Rails.application.routes.draw do
  resources :questions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #get '/users', to: 'users#index'
  resources :users
end
