Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :products, only: [:new, :index, :show, :create] do
    resources :product_features, only: [:new, :create]
  end
  root to: 'products#index'
end
