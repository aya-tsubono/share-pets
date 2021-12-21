Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'user_details', to: 'users/registrations#new_user_detail'
    post 'user_details', to: 'users/registrations#create_user_detail'
  end

  get 'pets/index'
  root to: 'pets#index'

  resources :pets do
    collection do
      get 'search'
    end
  end
  resources :users, only: [:show, :edit, :update]
  resources :rooms, only: [:new, :create] do
    resources :messages, only: [:index, :create]
  end
end
