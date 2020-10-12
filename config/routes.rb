Rails.application.routes.draw do
  root to: "folders#index"
  devise_for :users
  resources :folders, only: [:new, :create, :destroy] do
    resources :documents, only: [:index, :new, :create, :edit, :update, :destroy ] do
      collection do 
        post "sort"
      end
    end
    collection do
      post "search"
      collection do
        post "sort"
      end
    end
    collection do
      post "sort"
    end
  end
end
