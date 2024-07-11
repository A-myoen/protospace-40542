Rails.application.routes.draw do
  devise_for :users
  get 'prototypes/index'
  root 'prototypes#index'
  resources :prototypes, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :prototype do
    resources :comments , only: :create
  resources :users, only: :show
  end
end
