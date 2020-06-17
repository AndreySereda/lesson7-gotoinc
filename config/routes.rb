Rails.application.routes.draw do
  root 'page#home'
  devise_for :users, controllers: {
      sessions: 'users/sessions'
  }
  resources :questions, only: [:index]
  resources :users
  resources :assessments
end
