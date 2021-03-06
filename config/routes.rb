Rails.application.routes.draw do

  resources :posts do
    collection do
      post :confirm
      get 'list'
    end
  end

  resources :users do
    collection do
      get 'list'
    end
  end


  resources :sessions, only: [:index, :new, :create, :destroy]
  root to:'sessions#index'

  resources :bookmarks, only: [:create, :destroy]
  resources :follow_users, only: [:create, :destroy]

  resources :searchs

  resources :contacts do
    collection do
      post :confirm
    end
  end

  resources :tops, only: [:index]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end



end
