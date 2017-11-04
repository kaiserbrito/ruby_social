Rails.application.routes.draw do
  resources :posts
  resources :comments, only: [:create, :destroy]
  devise_for :users

  resources :users do
    member do
      get :friends
      get :followable
      get :deactivate
      get :mentionable
    end
  end


  resources events do
    collection do
      get :calendar
    end
  end

  authenticated :user do
    root to: 'home#index', as: 'home'
  end
  unauthenticated :user do
    root 'home#front'
  end

  match :follow, to: 'follows#create', as: :follow, via: :post
  match :unfollow, to: 'follows#destroy', as: :unfollow, via: :post
  match :like, to: 'likes#create', as: :like, via: :post
  match :unlike, to: 'likes#destroy', as: :unlike, via: :post
  match :find_friends, to: 'home#find_friends', as: :find_friends, via: :get


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
