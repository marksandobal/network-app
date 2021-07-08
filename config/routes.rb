Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :products do
    resources :comments, only: [:create], module: :products
  end

  resources :comments do
    resources :sub_comments, only: [:create], module: :comments
  end

  root to: 'products#index'
end
