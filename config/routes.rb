Rails.application.routes.draw do
  root to: "folders#index"
  devise_for :users
  resources :folders, only: [:new, :create] do
    resources :documents, only: [:index,:edit, :update, :destroy]
  end
end
