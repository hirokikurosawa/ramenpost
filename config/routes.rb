Rails.application.routes.draw do
  devise_for :users,
  controllers: {
  sessions: 'users/sessions',
  passwords: 'users/passwords',
  registrations: 'users/registrations'
  }

  devise_for :admins,
  controllers: {
  sessions: 'admins/sessions',
  passwords: 'admins/passwords',
  registrations: 'admins/registrations'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope module: :admins do
    get '/admins', to: 'homes#top'
  end

  namespace :admins do
    resources :users, only: [:index, :show, :edit, :update]
  end

  scope module: :users do
    root to: 'homes#top'
    get '/about' => 'homes#about'
    resources :users, only: [:show, :edit, :updaate, :destroy] do
      resource :relationships, only: [:create, :destroy]
      get :followings, on: :member
      get :followers, on: :member
      get :check, on: :collection
    end
    resources :posts, only: [:index, :new, :create, :show, :destroy] do
      resource :likes, only: [ :create, :destroy]
      get :following_posts, on: :collection
      get :likes_posts, on: :collection
      get :search, on: :collection
    end
  end
end
