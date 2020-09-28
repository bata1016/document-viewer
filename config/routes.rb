Rails.application.routes.draw do
  root to: "folders#index"
  devise_for :users
  resources :folders, only: [:new, :create, :destroy] do
    resources :documents, only: [:index, :new, :create, :edit, :update, :destroy]
    collection do
      get "search"
    end
  end
end
