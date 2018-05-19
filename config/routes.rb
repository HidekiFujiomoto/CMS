Rails.application.routes.draw do

  resources :posts do
    collection do
      post :confirm
    end
  end

  resources :users
  get 'top', to: 'users#top'

  resources :sessions, only: [:new, :create, :destroy]

  resources :bookmarks, only: [:create, :destroy]

  resources :searchs

  resources :contacts do
    collection do
      post :confirm
    end
  end

end
