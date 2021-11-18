Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  get 'pets/index'
  root to: 'pets#index'
end
