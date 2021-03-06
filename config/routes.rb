Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :shopping_lists, only: [:index, :create]
  end
  resources :users, only: [:edit, :update]
end

